# logwrapper

The utility class that logs the messages based on a TAG. Only one object is created for same tags.
For logging to files, specify directory/filename or else keep it null. In case of null tag as
argument, "DEFAULT-LOG-TAG" is used.

IMPORTANT NOTE: If being used as library each library should use it as static library and not as
shared library.

It has following features:
1.  Log based on different TAGS. Same LogWrapper object is shared for same TAGS.
2.  Log to file. Logging can be done based on TAGS.
3.  Separate Logging to file based on TAGS. Files can be created based on separate TAGS. File path
    and names can be specified while getting a LogWrapper object. Useful when we want to log only
    messages based on a certain TAG or from only a specific module.
4.  Enable/disable logging from a certain TAG at runtime.
5.  Deletion of log files after reaching MAX_SIZE as defined.

Generic use is:
LogWrapper mLog = LogWrapper.getLogger("TAG");
LogWrapper mModuleLog = LogWrapper.getLogger("MODULE_TAG","MODULE_LOG_DIR","MODULE_LOG_FILE");

Configuring LogWrapper:
Configuration should be done as part application start-up, allowed only once so that all instances
have same configuration. In following example its done in static block of main application class.
Not necessary and if not done DEFAULTS are used.

    static {
        LogConfig logConfig = LogWrapper.getConfigurator();
        try {
            logConfig.setConfig(BASE_TAG, LOG_DIR, LOG_FILE,LOG_FILE_SIZE);
        } catch (LogConfigAlreadySetException e) {
            Log.v(BASE_TAG, "Failed to configure LogWrapper. Error: " + e.getMessage());
        }
    }
