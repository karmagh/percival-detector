
#ifndef TOOLS_FILEWRITER_PERCIVALPROCESS2PLUGIN_H_
#define TOOLS_FILEWRITER_PERCIVALPROCESS2PLUGIN_H_

#include <log4cxx/logger.h>
#include <log4cxx/basicconfigurator.h>
#include <log4cxx/propertyconfigurator.h>
#include <log4cxx/helpers/exception.h>
using namespace log4cxx;
using namespace log4cxx::helpers;

#include "FrameProcessorPlugin.h"
#include "PercivalEmulatorDefinitions.h"
#include "ClassLoader.h"

namespace FrameProcessor
{

  /** Processing of Percival Frame objects.
   *
   * The PercivalProcess2Plugin class is responsible for receiving a raw data
   * Frame object and parsing the header information, splitting the raw data into
   * the two "data" and "reset" Frame objects.
   * This one was created at request from AM at Desy when it was noticed that
   * the data reordering in PercivalProcessPlugin was redundant, and it labeled
   * the reset and data frames the wrong way around. Feb 2020.
   */
  class PercivalProcess2Plugin : public FrameProcessorPlugin
  {
  public:
    PercivalProcess2Plugin();
    virtual ~PercivalProcess2Plugin();
    void configure(OdinData::IpcMessage &config, OdinData::IpcMessage &reply);
    void configureProcess(OdinData::IpcMessage &config, OdinData::IpcMessage &reply);
    bool reset_statistics();
    int get_version_major();
    int get_version_minor();
    int get_version_patch();
    std::string get_version_short();
    std::string get_version_long();

  private:
    /** Configuration constant for process related items */
    static const std::string CONFIG_PROCESS;
    /** Configuration constant for number of processes */
    static const std::string CONFIG_PROCESS_NUMBER;
    /** Configuration constant for this process rank */
    static const std::string CONFIG_PROCESS_RANK;

    void process_frame(boost::shared_ptr<Frame> frame);

    /** Pointer to logger */
    LoggerPtr logger_;

    size_t concurrent_processes_;
    size_t concurrent_rank_;

    /* Frame counter */
    uint32_t frame_counter_;
  };

  /**
   * Registration of this plugin through the ClassLoader.  This macro
   * registers the class without needing to worry about name mangling
   */
  REGISTER(FrameProcessorPlugin, PercivalProcess2Plugin, "PercivalProcess2Plugin");

} /* namespace FrameProcessor */

#endif /* TOOLS_FILEWRITER_PERCIVALPROCESSPLUGIN_H_ */
