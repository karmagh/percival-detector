
#include "FrameMem.h"

#include <sstream>

#include <H5Fpublic.h>
#include <H5Ppublic.h>
#include <H5Dpublic.h>
#include <H5Spublic.h>

/** These loadFromH5 functions are convenience functions to load calibration constants and
* do regression tests. The dataset can be double or uint16, and 2 or 3 dimensions. There
* are some differences between the types which is unfortunately why we need two
* functions (=template specializations). They don't need to be fast (h5 isnt)
* Memory needs to be allocated BEFORE calling them (do I want to change this?)
*
* @ret negative is failure.
*/
template<>
int64_t FrameMem<float>::loadFromH5(std::string filename, std::string dataset, int frameNo, std::string* outError)
{
    int64_t ret = -1;
    std::stringstream errs;
    hid_t file_id = H5Fopen(filename.c_str(), H5F_ACC_RDONLY, H5P_DEFAULT);
    if(0<=file_id)
    {
        hid_t ds_id = H5Dopen(file_id, dataset.c_str(), H5P_DEFAULT);
        if(0<ds_id)
        {
           hid_t dspace_id = H5Dget_space(ds_id);
           H5Sselect_all(dspace_id);
           hsize_t dimsCount2[2]={m_rows, m_cols};
           hid_t memspace_id = H5Screate_simple(2, dimsCount2, NULL);
           int ndims = H5Sget_simple_extent_ndims(dspace_id);
           if(ndims == 2)
           {
               hsize_t dims[2];
               H5Sget_simple_extent_dims(dspace_id, dims, NULL);
               if(dims[0] == m_rows && dims[1]==m_cols)
               {
                   double* ptr = static_cast<double*>(malloc(m_rows * m_cols * sizeof(double)));
                   H5Dread(ds_id, H5T_IEEE_F64LE, memspace_id, dspace_id, H5P_DEFAULT, ptr);
                   for(int r=0;r<m_rows;++r)
                   {
                       for(int c=0;c<m_cols;++c)
                       {
                           // these files seem to be row major
                           at(r,c) = static_cast<float>(ptr[m_cols * r + c]);
                       }
                   }
                   free(ptr);
                   ret = 0;
               }
               else
               {
                   errs << "Error dimension mismatch loading from H5:\n";
                   errs << " dataset is " << dims[0] << "x" << dims[1] << std::endl;
                   errs << " memblock is " << m_rows << "x" << m_cols << std::endl;
               }
           }
           else if(ndims == 3)
           {
               hsize_t dims[3], dimsStart[3]={frameNo,0,0}, dimsCount[3]={1, m_rows, m_cols};
               H5Sget_simple_extent_dims(dspace_id, dims, NULL);
               if(dims[1] == m_rows && dims[2]==m_cols)
               {
                   double* ptr = static_cast<double*>(malloc(m_rows * m_cols * sizeof(double)));
                   H5Sselect_hyperslab(dspace_id, H5S_SELECT_SET, dimsStart, NULL, dimsCount, NULL);
                   H5Dread(ds_id, H5T_IEEE_F64LE, memspace_id, dspace_id, H5P_DEFAULT, ptr);
                   for(int r=0;r<m_rows;++r)
                   {
                       for(int c=0;c<m_cols;++c)
                       {
                           at(r,c) = static_cast<float>(ptr[m_cols * r + c]);
                       }
                   }

                   free(ptr);
                   ret = 0;
               }
               else
               {
                   errs << "Error dimension mismatch:" << std::endl;
                   errs << " dataset is " << dims[0] << "x" << dims[1] << "x" << dims[2] << std::endl;
                   errs << " memblock is " << m_rows << "x" << m_cols << std::endl;
               }
           }

           H5Sclose(memspace_id);
           H5Sclose(dspace_id);
           H5Dclose(ds_id);
        }
        else
        {
            errs << "could not open dataset " << dataset << " in " << filename << std::endl;
        }

        H5Fclose(file_id);
    }
    else
    {
        errs << "could not open file " << filename << std::endl;
    }

    if(outError)
      *outError = errs.str();
    std::cout << errs.str();

    return ret;
}


template<>
int64_t FrameMem<uint16_t>::loadFromH5(std::string filename, std::string dataset, int frameNo, std::string* outError)
{
    int64_t rc = -1;
    std::stringstream errs;
    hid_t file_id = H5Fopen(filename.c_str(), H5F_ACC_RDONLY, H5P_DEFAULT);
    if(0<=file_id)
    {
        hid_t ds_id = H5Dopen(file_id, dataset.c_str(), H5P_DEFAULT);
        if(0<ds_id)
        {
           hid_t dspace_id = H5Dget_space(ds_id);
           int ndims = H5Sget_simple_extent_ndims(dspace_id);
           if(ndims == 3)
           {
               hsize_t dims[3], dimsStart[3]={frameNo,0,0}, dimsCount[3]={1, m_rows, m_cols}, dimsCount2[2]={m_rows, m_cols};
               hid_t memspace_id = H5Screate_simple(2, dimsCount2, NULL);
    // looks like they are all selected anyway!
     //          H5Sselect_all(memspace_id);
               H5Sget_simple_extent_dims(dspace_id, dims, NULL);
               if(dims[1] == m_rows && dims[2]==m_cols)
               {
                   H5Sselect_hyperslab(dspace_id, H5S_SELECT_SET, dimsStart, NULL, dimsCount, NULL);
                   H5Dread(ds_id, H5T_STD_U16LE, memspace_id, dspace_id, H5P_DEFAULT, data());
                   rc = 0;
               }
               else
               {
                   errs << "Error dimension mismatch:" << std::endl;
                   errs << " dataset is " << dims[0] << "x" << dims[1] << "x" << dims[2] << std::endl;
                   errs << " memblock is " << m_rows << "x" << m_cols << std::endl;
               }
               H5Sclose(memspace_id);
           }
           else
           {
               errs << "Error dimension mismatch; dataset must be 3d" << std::endl;
           }

           H5Sclose(dspace_id);
           H5Dclose(ds_id);
        }
        else
        {
            errs << "could not open dataset " << dataset << std::endl;
        }

        H5Fclose(file_id);
    }
    else
    {
        errs << "could not open file " << filename << std::endl;
    }

    if(outError)
      *outError = errs.str();
    std::cout << errs.str();

    return rc;
}


