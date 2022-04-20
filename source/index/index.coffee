################################################################################
toJson = (obj) -> JSON.stringify(obj, null, 4)

################################################################################
modulesToDebug = {}

################################################################################
#region exposedFunctions
export createLogFunctions = (modulename) ->
    log = (arg) ->
        if modulesToDebug[modulename]  then console.log "["+modulename+"]: " + arg
        return
    olog = (obj) -> log "\n" + toJson(obj)
    return { log, olog }

################################################################################
export debugOn = (modulename) ->
    modulesToDebug[modulename] = true
    return

export debugOff = (modulename) ->
    delete modulesToDebug[modulename]
    return

################################################################################
export addModulesToDebug = (toDebug) ->
    for name,toD of toDebug when toD then modulesToDebug[name] = true
    return

#endregion

