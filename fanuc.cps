/**
  Copyright (C) 2012-2022 by Autodesk, Inc.
  All rights reserved.

  FANUC post processor configuration.

  $Revision: 44025 11452e5b6c242e90bceb44f40895c87b1b47054e $
  $Date: 2022-11-08 12:19:46 $

  FORKID {04622D27-72F0-45d4-85FB-DB346FD1AE22}
*/

description = "FANUC";
vendor = "Fanuc";
vendorUrl = "http://www.fanuc.com";
legal = "Copyright (C) 2012-2022 by Autodesk, Inc.";
certificationLevel = 2;
minimumRevision = 45845;

longDescription = "Generic post for Fanuc.";

extension = "nc";
programNameIsInteger = true;
setCodePage("ascii");

capabilities = CAPABILITY_MILLING | CAPABILITY_MACHINE_SIMULATION;
tolerance = spatial(0.002, MM);

minimumChordLength = spatial(0.25, MM);
minimumCircularRadius = spatial(0.01, MM);
maximumCircularRadius = spatial(1000, MM);
minimumCircularSweep = toRad(0.01);
maximumCircularSweep = toRad(180);
allowHelicalMoves = true;
allowedCircularPlanes = undefined; // allow any circular motion
highFeedrate = (unit == IN) ? 500 : 5000;
probeMultipleFeatures = true;

// user-defined properties
properties = {
  writeMachine: {
    title      : "Write machine",
    description: "Output the machine settings in the header of the code.",
    group      : "formats",
    type       : "boolean",
    value      : true,
    scope      : "post"
  },
  writeTools: {
    title      : "Write tool list",
    description: "Output a tool list in the header of the code.",
    group      : "formats",
    type       : "boolean",
    value      : true,
    scope      : "post"
  },
  preloadTool: {
    title      : "Preload tool",
    description: "Preloads the next tool at a tool change (if any).",
    group      : "preferences",
    type       : "boolean",
    value      : true,
    scope      : "post"
  },
  showSequenceNumbers: {
    title      : "Use sequence numbers",
    description: "'Yes' outputs sequence numbers on each block, 'Only on tool change' outputs sequence numbers on tool change blocks only, and 'No' disables the output of sequence numbers.",
    group      : "formats",
    type       : "enum",
    values     : [
      {title:"Yes", id:"true"},
      {title:"No", id:"false"},
      {title:"Only on tool change", id:"toolChange"}
    ],
    value: "true",
    scope: "post"
  },
  sequenceNumberStart: {
    title      : "Start sequence number",
    description: "The number at which to start the sequence numbers.",
    group      : "formats",
    type       : "integer",
    value      : 10,
    scope      : "post"
  },
  sequenceNumberIncrement: {
    title      : "Sequence number increment",
    description: "The amount by which the sequence number is incremented by in each block.",
    group      : "formats",
    type       : "integer",
    value      : 5,
    scope      : "post"
  },
  optionalStop: {
    title      : "Optional stop",
    description: "Outputs optional stop code during when necessary in the code.",
    group      : "preferences",
    type       : "boolean",
    value      : true,
    scope      : "post"
  },
  o8: {
    title      : "8 Digit program number",
    description: "Specifies that an 8 digit program number is needed.",
    group      : "formats",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  separateWordsWithSpace: {
    title      : "Separate words with space",
    description: "Adds spaces between words if 'yes' is selected.",
    group      : "formats",
    type       : "boolean",
    value      : true,
    scope      : "post"
  },
  allow3DArcs: {
    title      : "Allow 3D arcs",
    description: "Specifies whether 3D circular arcs are allowed.",
    group      : "preferences",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  useRadius: {
    title      : "Radius arcs",
    description: "If yes is selected, arcs are outputted using radius values rather than IJK.",
    group      : "preferences",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  forceIJK: {
    title      : "Force IJK",
    description: "Force the output of IJK for G2/G3 when not using R mode.",
    group      : "preferences",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  useParametricFeed: {
    title      : "Parametric feed",
    description: "Specifies the feed value that should be output using a Q value.",
    group      : "preferences",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  showNotes: {
    title      : "Show notes",
    description: "Writes operation notes as comments in the outputted code.",
    group      : "formats",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  useSmoothing: {
    title      : "Use smoothing",
    description: "Defines the smoothing control mode (AICC/AIAPC). 'On' outputs G05.1 Q0/Q1 only, 'Automatic' or 'Level 1-10' outputs G05.1 Q1 with the R value for the desired level.",
    group      : "preferences",
    type       : "enum",
    values     : [
      {title:"Off", id:"-1"},
      {title:"On", id:"0"},
      {title:"Automatic", id:"9999"},
      {title:"Level 1", id:"1"},
      {title:"Level 2", id:"2"},
      {title:"Level 3", id:"3"},
      {title:"Level 4", id:"4"},
      {title:"Level 5", id:"5"},
      {title:"Level 6", id:"6"},
      {title:"Level 7", id:"7"},
      {title:"Level 8", id:"8"},
      {title:"Level 9", id:"9"},
      {title:"Level 10", id:"10"},
    ],
    value: "-1",
    scope: "post"
  },
  usePitchForTapping: {
    title      : "Use pitch for tapping",
    description: "Enables the use of pitch instead of feed for the F-word in canned tapping cycles. Your CNC control must be setup for pitch mode!",
    group      : "preferences",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  useG95: {
    title      : "Use G95",
    description: "Use IPR/MPR instead of IPM/MPM.",
    group      : "preferences",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  useG54x4: {
    title      : "Use G54.4",
    description: "Fanuc 30i supports G54.4 for workpiece error compensation.",
    group      : "probing",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  useSubroutines: {
    title      : "Use subroutines",
    description: "Select your desired subroutine option. 'All Operations' creates subroutines per each operation, 'Cycles' creates subroutines for cycle operations on same holes, and 'Patterns' creates subroutines for patterned operations.",
    group      : "preferences",
    type       : "enum",
    values     : [
      {title:"No", id:"none"},
      {title:"All Operations", id:"allOperations"},
      {title:"Cycles", id:"cycles"},
      {title:"Patterns", id:"patterns"}
    ],
    value: "none",
    scope: "post"
  },
  useFilesForSubprograms: {
    title      : "Use files for subroutines",
    description: "If enabled, subroutines will be saved as individual files.",
    group      : "preferences",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  safeStartAllOperations: {
    title      : "Safe start all operations",
    description: "Write optional blocks at the beginning of all operations that include all commands to start program.",
    group      : "preferences",
    type       : "boolean",
    value      : false,
    scope      : "post"
  },
  safePositionMethod: {
    title      : "Safe Retracts",
    description: "Select your desired retract option. 'Clearance Height' retracts to the operation clearance height.",
    group      : "homePositions",
    type       : "enum",
    values     : [
      {title:"G28", id:"G28"},
      {title:"G53", id:"G53"}
      // {title: "Clearance Height", id: "clearanceHeight"}
    ],
    value: "G28",
    scope: "post"
  },
  useRigidTapping: {
    title      : "Use rigid tapping",
    description: "Select 'Yes' to enable, 'No' to disable, or 'Without spindle direction' to enable rigid tapping without outputting the spindle direction block.",
    group      : "preferences",
    type       : "enum",
    values     : [
      {title:"Yes", id:"yes"},
      {title:"No", id:"no"},
      {title:"Without spindle direction", id:"without"}
    ],
    value: "yes",
    scope: "post"
  },
  singleResultsFile: {
    title      : "Create single results file",
    description: "Set to false if you want to store the measurement results for each probe / inspection toolpath in a separate file",
    group      : "probing",
    type       : "boolean",
    value      : true,
    scope      : "post"
  }
};

// wcs definiton
wcsDefinitions = {
  useZeroOffset: false,
  wcs          : [
    {name:"Standard", format:"G", range:[54, 59]},
    {name:"Extended", format:"G54.1 P", range:[1, 300]}
  ]
};

var gFormat = createFormat({prefix:"G", width:2, zeropad:true, decimals:1});
var mFormat = createFormat({prefix:"M", width:2, zeropad:true, decimals:1});
var hFormat = createFormat({prefix:"H", width:2, zeropad:true, decimals:1});
var dFormat = createFormat({prefix:"D", width:2, zeropad:true, decimals:1});
var probeWCSFormat = createFormat({decimals:0, forceDecimal:true});

var xyzFormat = createFormat({decimals:(unit == MM ? 3 : 4), forceDecimal:true});
var ijkFormat = createFormat({decimals:6, forceDecimal:true}); // unitless
var rFormat = xyzFormat; // radius
var abcFormat = createFormat({decimals:3, forceDecimal:true, scale:DEG});
var feedFormat = createFormat({decimals:(unit == MM ? 0 : 1), forceDecimal:true});
var inverseTimeFormat = createFormat({decimals:3, forceDecimal:true});
var pitchFormat = createFormat({decimals:(unit == MM ? 3 : 4), forceDecimal:true});
var toolFormat = createFormat({decimals:0});
var rpmFormat = createFormat({decimals:0});
var secFormat = createFormat({decimals:3, forceDecimal:true}); // seconds - range 0.001-99999.999
var milliFormat = createFormat({decimals:0}); // milliseconds // range 1-9999
var taperFormat = createFormat({decimals:1, scale:DEG});
var oFormat = createFormat({width:4, zeropad:true, decimals:0});
var peckFormat = createFormat({decimals:(unit == MM ? 3 : 4), forceDecimal:true});
// var peckFormat = createFormat({decimals:0, forceDecimal:false, trim:false, width:4, zeropad:true, scale:(unit == MM ? 1000 : 10000)});

var xOutput = createVariable({prefix:"X"}, xyzFormat);
var yOutput = createVariable({prefix:"Y"}, xyzFormat);
var zOutput = createVariable({onchange:function() {retracted = false;}, prefix:"Z"}, xyzFormat);
var toolVectorOutputI = createVariable({prefix:"I", force:true}, ijkFormat);
var toolVectorOutputJ = createVariable({prefix:"J", force:true}, ijkFormat);
var toolVectorOutputK = createVariable({prefix:"K", force:true}, ijkFormat);
var aOutput = createVariable({prefix:"A"}, abcFormat);
var bOutput = createVariable({prefix:"B"}, abcFormat);
var cOutput = createVariable({prefix:"C"}, abcFormat);
var feedOutput = createVariable({prefix:"F"}, feedFormat);
var inverseTimeOutput = createVariable({prefix:"F", force:true}, inverseTimeFormat);
var pitchOutput = createVariable({prefix:"F", force:true}, pitchFormat);
var sOutput = createVariable({prefix:"S", force:true}, rpmFormat);
var dOutput = createVariable({}, dFormat);
var peckOutput = createVariable({prefix:"Q", force:true}, peckFormat);

// circular output
var iOutput = createReferenceVariable({prefix:"I"}, xyzFormat);
var jOutput = createReferenceVariable({prefix:"J"}, xyzFormat);
var kOutput = createReferenceVariable({prefix:"K"}, xyzFormat);

var gMotionModal = createModal({}, gFormat); // modal group 1 // G0-G3, ...
var gPlaneModal = createModal({onchange:function () {gMotionModal.reset();}}, gFormat); // modal group 2 // G17-19
var gAbsIncModal = createModal({}, gFormat); // modal group 3 // G90-91
var gFeedModeModal = createModal({}, gFormat); // modal group 5 // G94-95
var gUnitModal = createModal({}, gFormat); // modal group 6 // G20-21
var gCycleModal = createModal({}, gFormat); // modal group 9 // G81, ...
var gRetractModal = createModal({}, gFormat); // modal group 10 // G98-99
var gRotationModal = createModal({
  onchange: function () {
    if (settings.probing.probeAngleMethod == "G68") {
      probeVariables.outputRotationCodes = true;
    }
  }
}, gFormat); // modal group 16 // G68-G69

var settings = {
  coolant: {
    // samples:
    // {id: COOLANT_THROUGH_TOOL, on: 88, off: 89}
    // {id: COOLANT_THROUGH_TOOL, on: [8, 88], off: [9, 89]}
    // {id: COOLANT_THROUGH_TOOL, on: "M88 P3 (myComment)", off: "M89"}
    coolants: [
      {id:COOLANT_FLOOD, on:8},
      {id:COOLANT_MIST},
      {id:COOLANT_THROUGH_TOOL, on:88, off:89},
      {id:COOLANT_AIR},
      {id:COOLANT_AIR_THROUGH_TOOL},
      {id:COOLANT_SUCTION},
      {id:COOLANT_FLOOD_MIST},
      {id:COOLANT_FLOOD_THROUGH_TOOL, on:[8, 88], off:[9, 89]},
      {id:COOLANT_OFF, off:9}
    ],
    singleLineCoolant: false, // specifies to output multiple coolant codes in one line rather than in separate lines
  },
  smoothing: {
    roughing              : 1, // roughing level for smoothing in automatic mode
    semi                  : 4, // semi-roughing level for smoothing in automatic mode
    semifinishing         : 7, // semi-finishing level for smoothing in automatic mode
    finishing             : 10, // finishing level for smoothing in automatic mode
    thresholdRoughing     : toPreciseUnit(0.5, MM), // operations with stock/tolerance above that threshold will use roughing level in automatic mode
    thresholdFinishing    : toPreciseUnit(0.05, MM), // operations with stock/tolerance below that threshold will use finishing level in automatic mode
    thresholdSemiFinishing: toPreciseUnit(0.1, MM), // operations with stock/tolerance above finishing and below threshold roughing that threshold will use semi finishing level in automatic mode

    differenceCriteria: "level", // options: "level", "tolerance", "both". Specifies criteria when output smoothing codes
    autoLevelCriteria : "stock", // use "stock" or "tolerance" to determine levels in automatic mode
    cancelCompensation: true // tool length compensation must be canceled prior to changing the smoothing level
  },
  retract: {
    cancelRotationOnRetracting: false, // specifies that rotations (G68) need to be canceled prior to retracting
    methodXY                  : "G28", // special condition, overwrite retract behavior per axis
    methodZ                   : undefined // special condition, overwrite retract behavior per axis
  },
  parametricFeeds: {
    firstFeedParameter    : 500, // specifies the initial parameter number to be used for parametric feedrate output
    feedAssignmentVariable: "#", // specifies the syntax to define a parameter
    feedOutputVariable    : "F#" // specifies the syntax to output the feedrate as parameter
  },
  unwind: {
    method        : 2, // 1 (move to closest 0 (G28)) or 2 (table does not move (G92))
    codes         : [gFormat.format(92)], // formatted code(s) that will (virtually) unwind axis (G90 G28), (G92), etc.
    workOffsetCode: "", // prefix for workoffset number if it is required to be output
    useAngle      : "true", // 'true' outputs angle with standard output variable, 'prefix' uses 'anglePrefix', 'false' does not output angle
    anglePrefix   : [], // optional prefixes for output angles specified as ["", "", "C"], use blank string if axis does not unwind
    resetG90      : false // set to 'true' if G90 needs to be output after the unwind block
  },
  machineAngles: { // refer to https://cam.autodesk.com/posts/reference/classMachineConfiguration.html#a14bcc7550639c482492b4ad05b1580c8
    controllingAxis: ABC,
    type           : PREFER_PREFERENCE,
    options        : ENABLE_ALL
  },
  workPlaneMethod: {
    useTiltedWorkplane    : true, // specifies that tilted workplanes should be used (ie. G68.2, G254, PLANE SPATIAL, CYCLE800), can be overwritten by property
    eulerConvention       : EULER_ZXZ_R, // specify the desired euler convention (ie EULER_XYZ_R), set to "undefined" to use machine angles for TWP commands
    cancelTiltFirst       : true, // cancel tilted workplane prior to WCS (G54-G59) blocks
    useABCPrepositioning  : false, // position ABC axes prior to tilted workplane blocks
    forceMultiAxisIndexing: false, // force multi-axis indexing for 3D programs
  },
  subprograms: {
    minimumCyclePoints: 5, // minimum number of points in cycle operation to consider for subprogram
    format            : oFormat, // the format to use for the subprogam number format
    startBlock        : {files:["%"], embedded:["O"]}, // specifies the start syntax of a subprogram followed by the subprogram number
    endBlock          : {files:["%"], embedded:[mFormat.format(99)]}, // specifies the command to for the end of a subprogram
    callBlock         : {files:[mFormat.format(98) + " P"], embedded:[mFormat.format(98) + " P"]} // specifies the command for calling a subprogram followed by the subprogram number
  },
  comments: {
    permittedCommentChars: " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,=_-",
    prefix               : "(", // specifies the prefix for the comment
    suffix               : ")", // specifies the suffix for the comment
    upperCase            : true, // set to true to output all comments in upper case
    maximumLineLength    : 80, // the maximum number of charaters allowed in a line
  },
  probing: {
    probeAngleMethod       : "OFF", // supported options are: OFF, AXIS_ROT, G68, G54.4
    allowIndexingWCSProbing: false // specifies that probe WCS with tool orientation is supported
  }
};

// collected state
var sequenceNumber;
var currentWorkOffset;
var optionalSection = false;
var forceSpindleSpeed = false;
var retracted = false; // specifies that the tool has been retracted to the safe plane

// used to convert blocks to optional for safeStartAllOperations, might get used outside of onSection
var operationNeedsSafeStart = false;

function onOpen() {
  // define and enable machine configuration
  receivedMachineConfiguration = machineConfiguration.isReceived();
  if (typeof defineMachine == "function") {
    defineMachine(); // hardcoded machine configuration
  }
  activateMachine(); // enable the machine optimizations and settings

  // postprocessor/machine specific requirements
  if (getProperty("useRadius")) {
    maximumCircularSweep = toRad(90); // avoid potential center calculation errors for CNC
  }
  gRotationModal.format(69); // Default to G69 Rotation Off
  if (!getProperty("separateWordsWithSpace")) {
    setWordSeparator("");
  }
  if (getProperty("forceIJK")) {
    iOutput = createReferenceVariable({prefix:"I", force:true}, xyzFormat);
    jOutput = createReferenceVariable({prefix:"J", force:true}, xyzFormat);
    kOutput = createReferenceVariable({prefix:"K", force:true}, xyzFormat);
  }
  if (getProperty("useG95")) {
    if (getProperty("useParametricFeed")) {
      error(localize("Parametric feed is not supported when using G95."));
      return;
    }
    feedFormat = createFormat({decimals:(unit == MM ? 4 : 5), forceDecimal:true});
    feedOutput = createVariable({prefix:"F"}, feedFormat);
  }
  sequenceNumber = getProperty("sequenceNumberStart");
  saveShowSequenceNumbers = getProperty("showSequenceNumbers");
  validateInitialWCS();

  writeln("%");
  writeProgramNumber();
  if (typeof inspectionWriteVariables == "function") { // Probing Surface Inspection
    inspectionWriteVariables();
  }
  writeProgramHeader();

  // absolute coordinates and feed per min
  writeBlock(gAbsIncModal.format(90), gFeedModeModal.format(getProperty("useG95") ? 95 : 94), gPlaneModal.format(17), gFormat.format(49), gFormat.format(40), gFormat.format(80));

  switch (unit) {
  case IN:
    writeBlock(gUnitModal.format(20));
    break;
  case MM:
    writeBlock(gUnitModal.format(21));
    break;
  }
}

var lengthCompensationActive = false;
/** Disables length compensation if currently active or if forced. */
function disableLengthCompensation(force) {
  if (lengthCompensationActive || force) {
    validate(retracted || skipBlock, "Cannot cancel length compensation if the machine is not fully retracted.");
    writeBlock(gFormat.format(49));
    lengthCompensationActive = false;
  }
}

function setSmoothing(mode) {
  smoothingSettings = settings.smoothing;
  if (mode == smoothing.isActive && (!mode || !smoothing.isDifferent) && !smoothing.force) {
    return; // return if smoothing is already active or is not different
  }
  if (typeof lengthCompensationActive != "undefined" && smoothingSettings.cancelCompensation) {
    validate(!lengthCompensationActive, "Length compensation is active while trying to update smoothing.");
  }

  var useNanoSmoothing = false; // set to true use nano smoothing G5.1 Q3
  if (mode) { // enable smoothing
    if (getProperty("useSmoothing") == "0") {
      writeBlock(gFormat.format(5.1), "Q1");
    } else {
      if (!useNanoSmoothing) {
        writeBlock(gFormat.format(5.1), "Q1", "R" + smoothing.level);
      } else {
        writeBlock(
          gFormat.format(5.1), "Q3",
          "X0", "Y0", "Z0",
          conditional(currentSection.isMultiAxis() && machineConfiguration.isMachineCoordinate(0), "A0"),
          conditional(currentSection.isMultiAxis() && machineConfiguration.isMachineCoordinate(1), "B0"),
          conditional(currentSection.isMultiAxis() && machineConfiguration.isMachineCoordinate(2), "C0"),
          "R" + smoothing.level
        );
      }
    }
  } else { // disable smoothing
    writeBlock(gFormat.format(5.1), "Q0");
  }
  smoothing.isActive = mode;
  smoothing.force = false;
  smoothing.isDifferent = false;
}

var currentWorkPlaneABC = undefined;

function forceWorkPlane() {
  currentWorkPlaneABC = undefined;
}

function cancelWorkPlane(force) {
  if (force) {
    gRotationModal.reset();
  }
  writeBlock(gRotationModal.format(69)); // cancel frame
  forceWorkPlane();
}

function setWorkPlane(abc) {
  if (!settings.workPlaneMethod.forceMultiAxisIndexing && is3D() && !machineConfiguration.isMultiAxisConfiguration()) {
    return; // ignore
  }
  var _skipBlock = false;
  if (!((currentWorkPlaneABC == undefined) ||
        abcFormat.areDifferent(abc.x, currentWorkPlaneABC.x) ||
        abcFormat.areDifferent(abc.y, currentWorkPlaneABC.y) ||
        abcFormat.areDifferent(abc.z, currentWorkPlaneABC.z))) {
    if (operationNeedsSafeStart) {
      _skipBlock = true;
    } else {
      return; // no change
    }
  }
  skipBlock = _skipBlock;
  onCommand(COMMAND_UNLOCK_MULTI_AXIS);

  if (!retracted) {
    skipBlock = _skipBlock;
    writeRetract(Z);
  }

  if (settings.workPlaneMethod.useTiltedWorkplane) {
    if (settings.workPlaneMethod.cancelTiltFirst) {
      skipBlock = _skipBlock;
      cancelWorkPlane();
    }
    if (machineConfiguration.isMultiAxisConfiguration()) {
      var machineABC = abc.isNonZero() ? getWorkPlaneMachineABC(currentSection.workPlane, false) : abc;
      if (settings.workPlaneMethod.useABCPrepositioning || machineABC.isZero()) {
        skipBlock = _skipBlock;
        positionABC(machineABC, true);
      }
    }
    if (abc.isNonZero()) {
      skipBlock = _skipBlock;
      gRotationModal.reset();
      writeBlock(gRotationModal.format(68.2), "X" + xyzFormat.format(0), "Y" + xyzFormat.format(0), "Z" + xyzFormat.format(0), "I" + abcFormat.format(abc.x), "J" + abcFormat.format(abc.y), "K" + abcFormat.format(abc.z)); // set frame
      skipBlock = _skipBlock;
      writeBlock(gFormat.format(53.1)); // turn machine
    } else {
      if (!settings.workPlaneMethod.cancelTiltFirst) {
        skipBlock = _skipBlock;
        cancelWorkPlane();
      }
    }
  } else {
    skipBlock = _skipBlock;
    positionABC(abc, true);
  }
  if (!currentSection.isMultiAxis()) {
    skipBlock = _skipBlock;
    onCommand(COMMAND_LOCK_MULTI_AXIS);
  }

  currentWorkPlaneABC = abc;
}

function writeToolCall(tool, insertToolCall) {
  if (tool.number > 99) {
    warning(localize("Tool number exceeds maximum value."));
  }
  if (tool.lengthOffset > 99) {
    error(localize("Length offset out of range."));
    return;
  }

  if (!isFirstSection() && insertToolCall) {
    forceWorkPlane();
    onCommand(COMMAND_COOLANT_OFF); // turn off coolant on tool change
    if (getProperty("optionalStop")) {
      onCommand(COMMAND_OPTIONAL_STOP);
    }
  }
  if (insertToolCall) {
    disableLengthCompensation(false);
  }
  skipBlock = !insertToolCall;
  writeToolBlock("T" + toolFormat.format(tool.number), mFormat.format(6));
  if (tool.comment) {
    writeComment(tool.comment);
  }
  var showToolZMin = false;
  if (showToolZMin) {
    if (is3D()) {
      var numberOfSections = getNumberOfSections();
      var zRange = currentSection.getGlobalZRange();
      var number = tool.number;
      for (var i = currentSection.getId() + 1; i < numberOfSections; ++i) {
        var section = getSection(i);
        if (section.getTool().number != number) {
          break;
        }
        zRange.expandToRange(section.getGlobalZRange());
      }
      writeComment(localize("ZMIN") + "=" + zRange.getMinimum());
    }
  }
}

function writeToolPreload(tool, insertToolCall) {
  if (getProperty("preloadTool")) {
    var nextTool = getNextTool(tool.number);
    if (nextTool) {
      skipBlock = !insertToolCall;
      writeBlock("T" + toolFormat.format(nextTool.number));
    } else {
      // preload first tool
      var firstToolNumber = getFirstTool().number;
      if (tool.number != firstToolNumber) {
        skipBlock = !insertToolCall;
        writeBlock("T" + toolFormat.format(firstToolNumber));
      }
    }
  }
}

function startSpindle(insertToolCall) {
  if (tool.type != TOOL_PROBE) {
    var outputSpindleSpeed = insertToolCall || forceSpindleSpeed || isFirstSection() ||
      rpmFormat.areDifferent(spindleSpeed, sOutput.getCurrent()) ||
      (tool.clockwise != getPreviousSection().getTool().clockwise);

    maximumSpindleRPM = machineConfiguration.getMaximumSpindleSpeed() > 0 ? machineConfiguration.getMaximumSpindleSpeed() : 99999;

    if (outputSpindleSpeed || operationNeedsSafeStart) {
      forceSpindleSpeed = false;
      if (spindleSpeed > maximumSpindleRPM) {
        warning(subst(localize("Spindle speed '" + spindleSpeed + " RPM' exceeds maximum value of '%1 RPM."), maximumSpindleRPM));
      }
      if (!isTappingCycle() || (isTappingCycle() && !(getProperty("useRigidTapping") == "without"))) {
        skipBlock = !outputSpindleSpeed;
        writeBlock(sOutput.format(spindleSpeed), mFormat.format(tool.clockwise ? 3 : 4));
      }
    }
  }
}

function onSection() {
  var zIsOutput = false; // true if the Z-position has been output, used for patterns

  var forceToolAndRetract = optionalSection && !currentSection.isOptional();
  optionalSection = currentSection.isOptional();
  var insertToolCall = isToolChangeNeeded("number") || forceToolAndRetract || currentSection.getForceToolChange();
  var newWorkOffset = isNewWorkOffset();
  var newWorkPlane = isNewWorkPlane();
  operationNeedsSafeStart = getProperty("safeStartAllOperations") && !isFirstSection();
  initializeSmoothing(); // initialize smoothing mode

  if (insertToolCall || newWorkOffset || newWorkPlane || smoothing.cancel) {
    if (insertToolCall && !isFirstSection()) {
      onCommand(COMMAND_STOP_SPINDLE); // stop spindle before retract during tool change
    }
    writeRetract(Z); // retract
    if (isFirstSection() && machineConfiguration.isMultiAxisConfiguration()) {
      setWorkPlane(new Vector(0, 0, 0)); // reset ABC axes / working plane
    }
    forceXYZ();
    if ((insertToolCall && !isFirstSection()) || smoothing.cancel) {
      disableLengthCompensation();
      setSmoothing(false);
    }
  }

  if (hasParameter("operation-comment")) {
    var comment = getParameter("operation-comment");
    if (comment && ((comment !== lastOperationComment) || !patternIsActive || insertToolCall)) {
      writeln("");
      writeComment(comment);
      lastOperationComment = comment;
    } else if (!patternIsActive || insertToolCall) {
      writeln("");
    }
  } else {
    writeln("");
  }

  if (getProperty("showNotes")) {
    writeSectionNotes();
  }

  if (operationNeedsSafeStart && !retracted) {
    skipBlock = true;
    writeRetract(Z);
  }

  // tool change
  if (insertToolCall || operationNeedsSafeStart) {
    writeToolCall(tool, insertToolCall);
    writeToolPreload(tool, insertToolCall);
  }
  // onCommand(COMMAND_START_SPINDLE)
  startSpindle(insertToolCall);

  // set wcs
  if (insertToolCall || operationNeedsSafeStart) {
    currentWorkOffset = undefined; // force work offset when changing tool
    skipBlock = operationNeedsSafeStart && !newWorkOffset && !insertToolCall;
  }
  if (currentSection.workOffset != currentWorkOffset) {
    if (settings.workPlaneMethod.cancelTiltFirst & !skipBlock) {
      cancelWorkPlane();
    }
    if (!skipBlock) {
      forceWorkPlane();
    }
    writeBlock(currentSection.wcs);
    currentWorkOffset = currentSection.workOffset;
  }

  forceXYZ();

  onCommand(COMMAND_START_CHIP_TRANSPORT);

  var abc = defineWorkPlane(currentSection, true);

  setProbeAngle(); // output probe angle rotations if required

  setCoolant(tool.coolant); // writes the required coolant codes

  setSmoothing(smoothing.isAllowed); // writes the required smoothing codes

  forceAny();
  gMotionModal.reset();

  // prepositioning
  var initialPosition = getFramePosition(currentSection.getInitialPosition());

  if (insertToolCall || !lengthCompensationActive || operationNeedsSafeStart || retracted || (!isFirstSection() && getPreviousSection().isMultiAxis())) {
    var _skipBlock = !(insertToolCall || retracted);
    gMotionModal.reset();
    writeBlock(gPlaneModal.format(17));
    skipBlock = _skipBlock;
    disableLengthCompensation(false); // cancel tool length compensation prior to enabling it, required when switching G43/G43.4 modes

    skipBlock = _skipBlock;
    writeInitialPositioning(initialPosition, abc, skipBlock);
    zIsOutput = !retracted;
  } else {
    if ((getCurrentPosition().z < initialPosition.z) && !retracted) {
      writeBlock(gMotionModal.format(0), zOutput.format(initialPosition.z));
      zIsOutput = true;
    }
    writeBlock(
      gAbsIncModal.format(90),
      gMotionModal.format(0),
      xOutput.format(initialPosition.x),
      yOutput.format(initialPosition.y)
    );
  }
  validate(lengthCompensationActive, "Length compensation is not active."); // make sure that lenght compensation is enabled

  // write parametric feedrate table
  if (typeof initializeParametricFeeds == "function") {
    initializeParametricFeeds(insertToolCall);
  }

  if (isProbeOperation()) {
    validate(settings.probing.probeAngleMethod != "G68", "You cannot probe while G68 Rotation is in effect.");
    validate(settings.probing.probeAngleMethod != "G54.4", "You cannot probe while workpiece setting error compensation G54.4 is enabled.");
    writeBlock(gFormat.format(65), "P" + 9832); // spin the probe on
    inspectionCreateResultsFileHeader();
  } else if (isInspectionOperation() && (typeof inspectionProcessSectionStart == "function")) {
    inspectionProcessSectionStart();
  }

  if (getProperty("useSubroutines") != "none") {
    subprogramDefine(initialPosition, abc, retracted, zIsOutput); // define subprogram
  }
  retracted = false;
}

function onDwell(seconds) {
  if (seconds > 99999.999) {
    warning(localize("Dwelling time is out of range."));
  }
  milliseconds = clamp(1, seconds * 1000, 99999999);
  writeBlock(gFeedModeModal.format(94), gFormat.format(4), "P" + milliFormat.format(milliseconds));
  writeBlock(gFeedModeModal.format(getProperty("useG95") ? 95 : 94)); // back to G95
}

function onSpindleSpeed(spindleSpeed) {
  writeBlock(sOutput.format(spindleSpeed));
}

function onCycle() {
  writeBlock(gPlaneModal.format(17));
}

function onCyclePoint(x, y, z) {
  if (isInspectionOperation()) {
    if (typeof inspectionCycleInspect == "function") {
      inspectionCycleInspect(cycle, x, y, z);
      return;
    } else {
      cycleNotSupported();
    }
  } else if (isProbeOperation()) {
    writeProbeCycle(cycle, x, y, z);
  } else {
    writeDrillCycle(cycle, x, y, z);
  }
}

function onCycleEnd() {
  if (isProbeOperation()) {
    zOutput.reset();
    gMotionModal.reset();
    writeBlock(gFormat.format(65), "P" + 9810, zOutput.format(cycle.retract)); // protected retract move
  } else {
    if (cycleSubprogramIsActive) {
      subprogramEnd();
    }
    if (!cycleExpanded) {
      writeBlock(conditional(!getProperty("useG95"), gFeedModeModal.format(94)), gCycleModal.format(80));
      zOutput.reset();
    }
  }
}

var mapCommand = {
  COMMAND_END                     : 2,
  COMMAND_SPINDLE_CLOCKWISE       : 3,
  COMMAND_SPINDLE_COUNTERCLOCKWISE: 4,
  COMMAND_STOP_SPINDLE            : 5,
  COMMAND_ORIENTATE_SPINDLE       : 19
};

function onCommand(command) {
  switch (command) {
  case COMMAND_COOLANT_OFF:
    setCoolant(COOLANT_OFF);
    return;
  case COMMAND_COOLANT_ON:
    setCoolant(COOLANT_FLOOD);
    return;
  case COMMAND_STOP:
    writeBlock(mFormat.format(0));
    forceSpindleSpeed = true;
    forceCoolant = true;
    return;
  case COMMAND_OPTIONAL_STOP:
    writeBlock(mFormat.format(1));
    forceSpindleSpeed = true;
    forceCoolant = true;
    return;
  case COMMAND_START_SPINDLE:
    onCommand(tool.clockwise ? COMMAND_SPINDLE_CLOCKWISE : COMMAND_SPINDLE_COUNTERCLOCKWISE);
    return;
  case COMMAND_LOCK_MULTI_AXIS:
    return;
  case COMMAND_UNLOCK_MULTI_AXIS:
    return;
  case COMMAND_START_CHIP_TRANSPORT:
    return;
  case COMMAND_STOP_CHIP_TRANSPORT:
    return;
  case COMMAND_BREAK_CONTROL:
    return;
  case COMMAND_TOOL_MEASURE:
    return;
  case COMMAND_PROBE_ON:
    return;
  case COMMAND_PROBE_OFF:
    return;
  }

  var stringId = getCommandStringId(command);
  var mcode = mapCommand[stringId];
  if (mcode != undefined) {
    writeBlock(mFormat.format(mcode));
  } else {
    onUnsupportedCommand(command);
  }
}

function onSectionEnd() {
  if (currentSection.isMultiAxis()) {
    writeBlock(gFeedModeModal.format(getProperty("useG95") ? 95 : 94)); // inverse time feed off
  }
  if (isInspectionOperation() && !isLastSection()) {
    writeBlock(getProperty("commissioningMode") ? onCommand(COMMAND_STOP) : "");
  }
  writeBlock(gPlaneModal.format(17));

  if (((getCurrentSectionId() + 1) >= getNumberOfSections()) ||
      (tool.number != getNextSection().getTool().number)) {
    onCommand(COMMAND_BREAK_CONTROL);
  }
  if (!isLastSection() && (getNextSection().getTool().coolant != tool.coolant)) {
    setCoolant(COOLANT_OFF);
  }

  if (typeof subprogramEnd == "function") {
    subprogramEnd();
  }

  if (isProbeOperation()) {
    writeBlock(gFormat.format(65), "P" + 9833); // spin the probe off
    if (settings.probing.probeAngleMethod != "G68") {
      setProbeAngle(); // output probe angle rotations if required
    }
  }
  forceAny();

  operationNeedsSafeStart = false; // reset for next section
}

// Start of onRewindMachine logic
/** Allow user to override the onRewind logic. */
function onRewindMachineEntry(_a, _b, _c) {
  return false;
}

/** Retract to safe position before indexing rotaries. */
function onMoveToSafeRetractPosition() {
  writeRetract(Z);
  // cancel TCP so that tool doesn't follow rotaries
  if (currentSection.isMultiAxis() && operationSupportsTCP) {
    disableLengthCompensation(false, "TCPC OFF");
  }
}

/** Rotate axes to new position above reentry position */
function onRotateAxes(_x, _y, _z, _a, _b, _c) {
  // position rotary axes
  xOutput.disable();
  yOutput.disable();
  zOutput.disable();
  invokeOnRapid5D(_x, _y, _z, _a, _b, _c);
  setCurrentABC(new Vector(_a, _b, _c));
  xOutput.enable();
  yOutput.enable();
  zOutput.enable();
}

/** Return from safe position after indexing rotaries. */
function onReturnFromSafeRetractPosition(_x, _y, _z) {
  // reinstate TCP / tool length compensation
  if (!lengthCompensationActive) {
    writeBlock(gFormat.format(getOffsetCode()), hFormat.format(tool.lengthOffset));
    lengthCompensationActive = true;
  }

  // position in XY
  forceXYZ();
  xOutput.reset();
  yOutput.reset();
  zOutput.disable();
  invokeOnRapid(_x, _y, _z);

  // position in Z
  zOutput.enable();
  invokeOnRapid(_x, _y, _z);
}
// End of onRewindMachine logic

function onClose() {
  if (isDPRNTopen) {
    writeln("DPRNT[END]");
    writeBlock("PCLOS");
    isDPRNTopen = false;
    if (typeof inspectionProcessSectionEnd == "function") {
      inspectionProcessSectionEnd();
    }
  }

  if (settings.probing.probeAngleMethod == "G68") {
    cancelWorkPlane();
  }
  writeln("");
  optionalSection = false;

  onCommand(COMMAND_COOLANT_OFF);

  writeRetract(Z); // retract

  disableLengthCompensation(true);
  setSmoothing(false);
  zOutput.reset();

  forceWorkPlane();
  setWorkPlane(new Vector(0, 0, 0)); // reset working plane

  if (settings.probing.probeAngleMethod == "G54.4") {
    writeBlock(gFormat.format(54.4), "P0");
  }

  writeRetract(X, Y); // return to home

  onImpliedCommand(COMMAND_END);
  onImpliedCommand(COMMAND_STOP_SPINDLE);
  writeBlock(mFormat.format(30)); // stop program, spindle stop, coolant off
  if (subprograms.length > 0) {
    writeln("");
    write(subprograms);
  }

  writeln("%");
}

// >>>>> INCLUDED FROM include_files/commonFunctions.cpi
// internal variables, do not change
var receivedMachineConfiguration;
var operationSupportsTCP;
var multiAxisFeedrate;

function activateMachine() {
  // disable unsupported rotary axes output
  if (!machineConfiguration.isMachineCoordinate(0) && (typeof aOutput != "undefined")) {
    aOutput.disable();
  }
  if (!machineConfiguration.isMachineCoordinate(1) && (typeof bOutput != "undefined")) {
    bOutput.disable();
  }
  if (!machineConfiguration.isMachineCoordinate(2) && (typeof cOutput != "undefined")) {
    cOutput.disable();
  }

  // setup usage of useTiltedWorkplane
  settings.workPlaneMethod.useTiltedWorkplane = getProperty("useTiltedWorkplane") != undefined ? getProperty("useTiltedWorkplane") :
    (settings.workPlaneMethod.useTiltedWorkplane != undefined ? settings.workPlaneMethod.useTiltedWorkplane : false);
  settings.workPlaneMethod.useABCPrepositioning = getProperty("useABCPrepositioning") != undefined ? getProperty("useABCPrepositioning") :
    (settings.workPlaneMethod.useABCPrepositioning != undefined ? settings.workPlaneMethod.useABCPrepositioning : false);

  if (!machineConfiguration.isMultiAxisConfiguration()) {
    return; // don't need to modify any settings for 3-axis machines
  }

  // save multi-axis feedrate settings from machine configuration
  var mode = machineConfiguration.getMultiAxisFeedrateMode();
  var type = mode == FEED_INVERSE_TIME ? machineConfiguration.getMultiAxisFeedrateInverseTimeUnits() :
    (mode == FEED_DPM ? machineConfiguration.getMultiAxisFeedrateDPMType() : DPM_STANDARD);
  multiAxisFeedrate = {
    mode     : mode,
    maximum  : machineConfiguration.getMultiAxisFeedrateMaximum(),
    type     : type,
    tolerance: mode == FEED_DPM ? machineConfiguration.getMultiAxisFeedrateOutputTolerance() : 0,
    bpwRatio : mode == FEED_DPM ? machineConfiguration.getMultiAxisFeedrateBpwRatio() : 1
  };

  // setup of retract/reconfigure  TAG: Only needed until post kernel supports these machine config settings
  if (receivedMachineConfiguration && machineConfiguration.performRewinds()) {
    safeRetractDistance = machineConfiguration.getSafeRetractDistance();
    safePlungeFeed = machineConfiguration.getSafePlungeFeedrate();
    safeRetractFeed = machineConfiguration.getSafeRetractFeedrate();
  }
  if (typeof safeRetractDistance == "number" && getProperty("safeRetractDistance") != undefined && getProperty("safeRetractDistance") != 0) {
    safeRetractDistance = getProperty("safeRetractDistance");
  }

  if (machineConfiguration.isHeadConfiguration()) {
    compensateToolLength = typeof compensateToolLength == "undefined" ? false : compensateToolLength;
  }

  if (machineConfiguration.isHeadConfiguration() && compensateToolLength) {
    for (var i = 0; i < getNumberOfSections(); ++i) {
      var section = getSection(i);
      if (section.isMultiAxis()) {
        machineConfiguration.setToolLength(getBodyLength(section.getTool())); // define the tool length for head adjustments
        section.optimizeMachineAnglesByMachine(machineConfiguration, OPTIMIZE_AXIS);
      }
    }
  } else {
    optimizeMachineAngles2(OPTIMIZE_AXIS);
  }
}

function getBodyLength(tool) {
  for (var i = 0; i < getNumberOfSections(); ++i) {
    var section = getSection(i);
    if (tool.number == section.getTool().number) {
      return section.getParameter("operation:tool_overallLength", tool.bodyLength + tool.holderLength);
    }
  }
  return tool.bodyLength + tool.holderLength;
}

function getFeed(f) {
  if (getProperty("useG95")) {
    return feedOutput.format(f / spindleSpeed); // use feed value
  }
  if (activeMovements) {
    var feedContext = activeMovements[movement];
    if (feedContext != undefined) {
      if (!feedFormat.areDifferent(feedContext.feed, f)) {
        if (feedContext.id == currentFeedId) {
          return ""; // nothing has changed
        }
        forceFeed();
        currentFeedId = feedContext.id;
        return settings.parametricFeeds.feedOutputVariable + (settings.parametricFeeds.firstFeedParameter + feedContext.id);
      }
    }
    currentFeedId = undefined; // force parametric feed next time
  }
  return feedOutput.format(f); // use feed value
}

function validateInitialWCS() {
  if ((getNumberOfSections() > 0) && (getSection(0).workOffset == 0)) {
    for (var i = 0; i < getNumberOfSections(); ++i) {
      if (getSection(i).workOffset > 0) {
        error(localize("Using multiple work offsets is not possible if the initial work offset is 0."));
        return;
      }
    }
  }
}

function forceFeed() {
  currentFeedId = undefined;
  feedOutput.reset();
}

/** Force output of X, Y, and Z. */
function forceXYZ() {
  xOutput.reset();
  yOutput.reset();
  zOutput.reset();
}

/** Force output of A, B, and C. */
function forceABC() {
  aOutput.reset();
  bOutput.reset();
  cOutput.reset();
}

/** Force output of X, Y, Z, A, B, C, and F on next output. */
function forceAny() {
  forceXYZ();
  forceABC();
  forceFeed();
}

/**
  Writes the specified block.
*/
var skipBlock = false;
function writeBlock() {
  var text = formatWords(arguments);
  if (!text) {
    return;
  }
  if (getProperty("showSequenceNumbers") == "true") {
    if (optionalSection || skipBlock) {
      if (text) {
        writeWords("/", "N" + sequenceNumber, text);
      }
    } else {
      writeWords2("N" + sequenceNumber, arguments);
    }
    sequenceNumber += getProperty("sequenceNumberIncrement");
  } else {
    if (optionalSection || skipBlock) {
      writeWords2("/", arguments);
    } else {
      writeWords(arguments);
    }
  }
  skipBlock = false;
}

validate(settings.comments, "Setting 'comments' is required but not defined.");
function formatComment(text) {
  var prefix = settings.comments.prefix;
  var suffix = settings.comments.suffix;
  text = settings.comments.upperCase ? text.toUpperCase() : text;
  return prefix + filterText(String(text), settings.comments.permittedCommentChars).replace(/[()]/g, "") + suffix;
}

/**
  Output a comment.
*/
function writeComment(text) {
  writeln(formatComment(text.substr(0, settings.comments.maximumLineLength - 2)));
}

function onComment(message) {
  var comments = String(message).split("\n");
  for (comment in comments) {
    writeComment(comments[comment]);
  }
}

/**
  Writes the specified block - used for tool changes only.
*/
function writeToolBlock() {
  var show = getProperty("showSequenceNumbers");
  setProperty("showSequenceNumbers", (show == "true" || show == "toolChange") ? "true" : "false");
  writeBlock(arguments);
  setProperty("showSequenceNumbers", show);
}

var pendingRadiusCompensation = -1;
function onRadiusCompensation() {
  pendingRadiusCompensation = radiusCompensation;
}

/** Helper function to be able to use a default value for settings which do not exist. */
function getSetting(_setting, defaultValue) {
  return _setting != undefined ? _setting : defaultValue;
}
// <<<<< INCLUDED FROM include_files/commonFunctions.cpi
// >>>>> INCLUDED FROM include_files/defineMachine.cpi
var compensateToolLength = false; // add the tool length to the pivot distance for nonTCP rotary heads
function defineMachine() {
  var useTCP = true;
  if (false) { // note: setup your machine here
    var aAxis = createAxis({coordinate:0, table:true, axis:[1, 0, 0], range:[-120, 120], preference:1, tcp:useTCP});
    var cAxis = createAxis({coordinate:2, table:true, axis:[0, 0, 1], range:[-360, 360], preference:0, tcp:useTCP});
    machineConfiguration = new MachineConfiguration(aAxis, cAxis);

    setMachineConfiguration(machineConfiguration);
    if (receivedMachineConfiguration) {
      warning(localize("The provided CAM machine configuration is overwritten by the postprocessor."));
      receivedMachineConfiguration = false; // CAM provided machine configuration is overwritten
    }
  }

  if (!receivedMachineConfiguration) {
    // multiaxis settings
    if (machineConfiguration.isHeadConfiguration()) {
      machineConfiguration.setVirtualTooltip(false); // translate the pivot point to the virtual tool tip for nonTCP rotary heads
    }

    // retract / reconfigure
    var performRewinds = false; // set to true to enable the rewind/reconfigure logic
    if (performRewinds) {
      machineConfiguration.enableMachineRewinds(); // enables the retract/reconfigure logic
      safeRetractDistance = (unit == IN) ? 1 : 25; // additional distance to retract out of stock, can be overridden with a property
      safeRetractFeed = (unit == IN) ? 20 : 500; // retract feed rate
      safePlungeFeed = (unit == IN) ? 10 : 250; // plunge feed rate
      machineConfiguration.setSafeRetractDistance(safeRetractDistance);
      machineConfiguration.setSafeRetractFeedrate(safeRetractFeed);
      machineConfiguration.setSafePlungeFeedrate(safePlungeFeed);
      var stockExpansion = new Vector(toPreciseUnit(0.1, IN), toPreciseUnit(0.1, IN), toPreciseUnit(0.1, IN)); // expand stock XYZ values
      machineConfiguration.setRewindStockExpansion(stockExpansion);
    }

    // multi-axis feedrates
    if (machineConfiguration.isMultiAxisConfiguration()) {
      machineConfiguration.setMultiAxisFeedrate(
        useTCP ? FEED_FPM : getProperty("useDPMFeeds") ? FEED_DPM : FEED_INVERSE_TIME,
        9999.99, // maximum output value for inverse time feed rates
        getProperty("useDPMFeeds") ? DPM_COMBINATION : INVERSE_MINUTES, // INVERSE_MINUTES/INVERSE_SECONDS or DPM_COMBINATION/DPM_STANDARD
        0.5, // tolerance to determine when the DPM feed has changed
        1.0 // ratio of rotary accuracy to linear accuracy for DPM calculations
      );
      setMachineConfiguration(machineConfiguration);
    }

    /* home positions */
    // machineConfiguration.setHomePositionX(toPreciseUnit(0, IN));
    // machineConfiguration.setHomePositionY(toPreciseUnit(0, IN));
    // machineConfiguration.setRetractPlane(toPreciseUnit(0, IN));
  }
}
// <<<<< INCLUDED FROM include_files/defineMachine.cpi
// >>>>> INCLUDED FROM include_files/defineWorkPlane.cpi
validate(settings.workPlaneMethod, "Setting 'workPlaneMethod' is required but not defined.");
function defineWorkPlane(_section, _setWorkPlane) {
  var abc = new Vector(0, 0, 0);
  if (settings.workPlaneMethod.forceMultiAxisIndexing || !is3D() || machineConfiguration.isMultiAxisConfiguration()) {
    if (isPolarModeActive()) {
      abc = getCurrentDirection();
    } else if (_section.isMultiAxis()) {
      cancelTransformation();
      abc = _section.isOptimizedForMachine() ? _section.getInitialToolAxisABC() : _section.getGlobalInitialToolAxis();
    } else if (settings.workPlaneMethod.eulerConvention != undefined) {
      abc = _section.workPlane.getEuler2(settings.workPlaneMethod.eulerConvention);
    } else {
      abc = getWorkPlaneMachineABC(_section.workPlane, true);
    }

    if (_setWorkPlane) {
      if (_section.isMultiAxis() || isPolarModeActive()) { // 4-5x simultaneous operations
        cancelWorkPlane();
        positionABC(abc, true);
      } else { // 3x and/or 3+2x operations
        setWorkPlane(abc);
      }
    }
  } else {
    var remaining = _section.workPlane;
    if (!isSameDirection(remaining.forward, new Vector(0, 0, 1))) {
      error(localize("Tool orientation is not supported."));
      return abc;
    }
    setRotation(remaining);
  }
  if (currentSection && (currentSection.getId() == _section.getId())) {
    operationSupportsTCP = currentSection.getOptimizedTCPMode() == OPTIMIZE_NONE;
    if (!currentSection.isMultiAxis() && (settings.workPlaneMethod.useTiltedWorkplane || isSameDirection(machineConfiguration.getSpindleAxis(), currentSection.workPlane.forward))) {
      operationSupportsTCP = false;
    }
  }
  return abc;
}
// <<<<< INCLUDED FROM include_files/defineWorkPlane.cpi
// >>>>> INCLUDED FROM include_files/getWorkPlaneMachineABC.cpi
validate(settings.machineAngles, "Setting 'machineAngles' is required but not defined.");
function getWorkPlaneMachineABC(workPlane, rotate) {
  var currentABC = isFirstSection() ? new Vector(0, 0, 0) : getCurrentDirection();
  var abc = machineConfiguration.getABCByPreference(workPlane, currentABC, settings.machineAngles.controllingAxis, settings.machineAngles.type, settings.machineAngles.options);
  if (!isSameDirection(machineConfiguration.getDirection(abc), workPlane.forward)) {
    error(localize("Orientation not supported."));
  }
  if (rotate) {
    if (true /*|| revision <= 45838*/) {
      var tcp = false;
      var R = machineConfiguration.getRemainingOrientation(abc, workPlane);
      setRotation(tcp ? workPlane : R);
      setCurrentDirection(currentABC); // temporary fix for currentDirection
    } else {
      if (!currentSection.isOptimizedForMachine()) {
        machineConfiguration.setToolLength(compensateToolLength ? currentSection.getTool().overallLength : 0); // define the tool length for head adjustments
        currentSection.optimize3DPositionsByMachine(machineConfiguration, abc, OPTIMIZE_AXIS);
      }
    }
  }
  return abc;
}
// <<<<< INCLUDED FROM include_files/getWorkPlaneMachineABC.cpi
// >>>>> INCLUDED FROM include_files/positionABC.cpi
function positionABC(abc, force) {
  if (typeof unwindABC == "function") {
    unwindABC(abc);
  }
  if (force) {
    forceABC();
  }
  var a = machineConfiguration.isMultiAxisConfiguration() ? aOutput.format(abc.x) : toolVectorOutputI.format(abc.x);
  var b = machineConfiguration.isMultiAxisConfiguration() ? bOutput.format(abc.y) : toolVectorOutputJ.format(abc.y);
  var c = machineConfiguration.isMultiAxisConfiguration() ? cOutput.format(abc.z) : toolVectorOutputK.format(abc.z);
  if (a || b || c) {
    if (!retracted) {
      if (typeof moveToSafeRetractPosition == "function") {
        moveToSafeRetractPosition();
      } else {
        writeRetract(Z);
      }
    }
    onCommand(COMMAND_UNLOCK_MULTI_AXIS);
    gMotionModal.reset();
    writeBlock(gMotionModal.format(0), a, b, c);

    if (getCurrentSectionId() != -1) {
      setCurrentABC(abc); // required for machine simulation
    }
  }
}
// <<<<< INCLUDED FROM include_files/positionABC.cpi
// >>>>> INCLUDED FROM include_files/unwindABC.cpi
function unwindABC(abc) {
  if (settings.unwind == undefined) {
    return;
  }
  if (settings.unwind.method != 1 && settings.unwind.method != 2) {
    error(localize("Unsupported unwindABC method."));
    return;
  }

  var axes = new Array(machineConfiguration.getAxisU(), machineConfiguration.getAxisV(), machineConfiguration.getAxisW());
  var currentDirection = getCurrentDirection();
  for (var i in axes) {
    if (axes[i].isEnabled() && (settings.unwind.useAngle != "prefix" || settings.unwind.anglePrefix[axes[i].getCoordinate] != "")) {
      var j = axes[i].getCoordinate();

      // only use the active axis in calculations
      var tempABC = new Vector(0, 0, 0);
      tempABC.setCoordinate(j, abc.getCoordinate(j));
      var tempCurrent = new Vector(0, 0, 0); // only use the active axis in calculations
      tempCurrent.setCoordinate(j, currentDirection.getCoordinate(j));
      var orientation = machineConfiguration.getOrientation(tempCurrent);

      // get closest angle without respecting 'reset' flag
      // and distance from previous angle to closest abc
      var nearestABC = machineConfiguration.getABCByPreference(orientation, tempABC, ABC, PREFER_PREFERENCE, ENABLE_WCS);
      var distanceABC = abcFormat.getResultingValue(Math.abs(Vector.diff(getCurrentDirection(), abc).getCoordinate(j)));

      // calculate distance from calculated abc to closest abc
      // include move to origin for G28 moves
      var distanceOrigin = 0;
      if (settings.unwind.method == 2) {
        distanceOrigin = abcFormat.getResultingValue(Math.abs(Vector.diff(nearestABC, abc).getCoordinate(j)));
      } else { // closest angle
        distanceOrigin = abcFormat.getResultingValue(Math.abs(getCurrentDirection().getCoordinate(j))) % 360; // calculate distance for unwinding axis
        distanceOrigin = (distanceOrigin > 180) ? 360 - distanceOrigin : distanceOrigin; // take shortest route to 0
        distanceOrigin += abcFormat.getResultingValue(Math.abs(abc.getCoordinate(j))); // add distance from 0 to new position
      }

      // determine if the axis needs to be rewound and rewind it if required
      var revolutions = distanceABC / 360;
      var angle = settings.unwind.method == 2 ? nearestABC.getCoordinate(j) : 0;
      if (distanceABC > distanceOrigin && (settings.unwind.method == 2 || (revolutions > 1))) { // G28 method will move rotary, so make sure move is greater than 360 degrees
        if (!retracted) {
          if (typeof moveToSafeRetractPosition == "function") {
            moveToSafeRetractPosition();
          } else {
            writeRetract(Z);
          }
        }
        onCommand(COMMAND_UNLOCK_MULTI_AXIS);
        var outputs = [aOutput, bOutput, cOutput];
        outputs[j].reset();
        writeBlock(
          settings.unwind.codes,
          settings.unwind.workOffsetCode ? settings.unwind.workOffsetCode + currentWorkOffset : "",
          settings.unwind.useAngle == "true" ? outputs[j].format(angle) :
            (settings.unwind.useAngle == "prefix" ? settings.unwind.anglePrefix[j] + abcFormat.format(angle) : "")
        );
        if (settings.unwind.resetG90) {
          gAbsIncModal.reset();
          writeBlock(gAbsIncModal.format(90));
        }
        outputs[j].reset();

        // set the current rotary axis angle from the unwind block
        currentDirection.setCoordinate(j, angle);
        setCurrentDirection(currentDirection);
      }
    }
  }
}
// <<<<< INCLUDED FROM include_files/unwindABC.cpi

// >>>>> INCLUDED FROM include_files/motionFunctions_fanuc.cpi
function onRapid(_x, _y, _z) {
  var x = xOutput.format(_x);
  var y = yOutput.format(_y);
  var z = zOutput.format(_z);
  if (x || y || z) {
    if (pendingRadiusCompensation >= 0) {
      error(localize("Radius compensation mode cannot be changed at rapid traversal."));
      return;
    }
    writeBlock(gMotionModal.format(0), x, y, z);
    forceFeed();
  }
}

function onRapid5D(_x, _y, _z, _a, _b, _c) {
  if (pendingRadiusCompensation >= 0) {
    error(localize("Radius compensation mode cannot be changed at rapid traversal."));
    return;
  }
  if (!currentSection.isOptimizedForMachine()) {
    forceXYZ();
  }
  var x = xOutput.format(_x);
  var y = yOutput.format(_y);
  var z = zOutput.format(_z);
  var a = currentSection.isOptimizedForMachine() ? aOutput.format(_a) : toolVectorOutputI.format(_a);
  var b = currentSection.isOptimizedForMachine() ? bOutput.format(_b) : toolVectorOutputJ.format(_b);
  var c = currentSection.isOptimizedForMachine() ? cOutput.format(_c) : toolVectorOutputK.format(_c);

  writeBlock(gMotionModal.format(0), x, y, z, a, b, c);
  forceFeed();
}

function onLinear(_x, _y, _z, feed) {
  var x = xOutput.format(_x);
  var y = yOutput.format(_y);
  var z = zOutput.format(_z);
  var f = getFeed(feed);
  if (x || y || z) {
    if (pendingRadiusCompensation >= 0) {
      pendingRadiusCompensation = -1;
      var d = tool.diameterOffset;
      if (d > 99) {
        warning(localize("The diameter offset exceeds the maximum value."));
      }
      writeBlock(gPlaneModal.format(17));
      switch (radiusCompensation) {
      case RADIUS_COMPENSATION_LEFT:
        dOutput.reset();
        writeBlock(gMotionModal.format(1), gFormat.format(41), x, y, z, dOutput.format(d), f);
        break;
      case RADIUS_COMPENSATION_RIGHT:
        dOutput.reset();
        writeBlock(gMotionModal.format(1), gFormat.format(42), x, y, z, dOutput.format(d), f);
        break;
      default:
        writeBlock(gMotionModal.format(1), gFormat.format(40), x, y, z, f);
      }
    } else {
      writeBlock(gMotionModal.format(1), x, y, z, f);
    }
  } else if (f) {
    if (getNextRecord().isMotion()) { // try not to output feed without motion
      forceFeed(); // force feed on next line
    } else {
      writeBlock(gMotionModal.format(1), f);
    }
  }
}

function onLinear5D(_x, _y, _z, _a, _b, _c, feed, feedMode) {
  if (pendingRadiusCompensation >= 0) {
    error(localize("Radius compensation cannot be activated/deactivated for 5-axis move."));
    return;
  }
  if (!currentSection.isOptimizedForMachine()) {
    forceXYZ();
  }
  var x = xOutput.format(_x);
  var y = yOutput.format(_y);
  var z = zOutput.format(_z);
  var a = currentSection.isOptimizedForMachine() ? aOutput.format(_a) : toolVectorOutputI.format(_a);
  var b = currentSection.isOptimizedForMachine() ? bOutput.format(_b) : toolVectorOutputJ.format(_b);
  var c = currentSection.isOptimizedForMachine() ? cOutput.format(_c) : toolVectorOutputK.format(_c);
  if (feedMode == FEED_INVERSE_TIME) {
    forceFeed();
  }
  var f = feedMode == FEED_INVERSE_TIME ? inverseTimeOutput.format(feed) : getFeed(feed);
  var fMode = feedMode == FEED_INVERSE_TIME ? 93 : getProperty("useG95") ? 95 : 94;

  if (x || y || z || a || b || c) {
    writeBlock(gFeedModeModal.format(fMode), gMotionModal.format(1), x, y, z, a, b, c, f);
  } else if (f) {
    if (getNextRecord().isMotion()) { // try not to output feed without motion
      forceFeed(); // force feed on next line
    } else {
      writeBlock(gFeedModeModal.format(fMode), gMotionModal.format(1), f);
    }
  }
}

function onCircular(clockwise, cx, cy, cz, x, y, z, feed) {
  if (pendingRadiusCompensation >= 0) {
    error(localize("Radius compensation cannot be activated/deactivated for a circular move."));
    return;
  }

  var start = getCurrentPosition();

  if (isFullCircle()) {
    if (getProperty("useRadius") || isHelical()) { // radius mode does not support full arcs
      linearize(tolerance);
      return;
    }
    switch (getCircularPlane()) {
    case PLANE_XY:
      writeBlock(gPlaneModal.format(17), gMotionModal.format(clockwise ? 2 : 3), iOutput.format(cx - start.x, 0), jOutput.format(cy - start.y, 0), getFeed(feed));
      break;
    case PLANE_ZX:
      writeBlock(gPlaneModal.format(18), gMotionModal.format(clockwise ? 2 : 3), iOutput.format(cx - start.x, 0), kOutput.format(cz - start.z, 0), getFeed(feed));
      break;
    case PLANE_YZ:
      writeBlock(gPlaneModal.format(19), gMotionModal.format(clockwise ? 2 : 3), jOutput.format(cy - start.y, 0), kOutput.format(cz - start.z, 0), getFeed(feed));
      break;
    default:
      linearize(tolerance);
    }
  } else if (!getProperty("useRadius")) {
    switch (getCircularPlane()) {
    case PLANE_XY:
      writeBlock(gPlaneModal.format(17), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), iOutput.format(cx - start.x, 0), jOutput.format(cy - start.y, 0), getFeed(feed));
      break;
    case PLANE_ZX:
      writeBlock(gPlaneModal.format(18), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), iOutput.format(cx - start.x, 0), kOutput.format(cz - start.z, 0), getFeed(feed));
      break;
    case PLANE_YZ:
      writeBlock(gPlaneModal.format(19), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), jOutput.format(cy - start.y, 0), kOutput.format(cz - start.z, 0), getFeed(feed));
      break;
    default:
      if (getProperty("allow3DArcs")) {
        // make sure maximumCircularSweep is well below 360deg
        // we could use G02.4 or G03.4 - direction is calculated
        var ip = getPositionU(0.5);
        writeBlock(gMotionModal.format(clockwise ? 2.4 : 3.4), xOutput.format(ip.x), yOutput.format(ip.y), zOutput.format(ip.z), getFeed(feed));
        writeBlock(xOutput.format(x), yOutput.format(y), zOutput.format(z));
      } else {
        linearize(tolerance);
      }
    }
  } else { // use radius mode
    var r = getCircularRadius();
    if (toDeg(getCircularSweep()) > (180 + 1e-9)) {
      r = -r; // allow up to <360 deg arcs
    }
    switch (getCircularPlane()) {
    case PLANE_XY:
      writeBlock(gPlaneModal.format(17), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), "R" + rFormat.format(r), getFeed(feed));
      break;
    case PLANE_ZX:
      writeBlock(gPlaneModal.format(18), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), "R" + rFormat.format(r), getFeed(feed));
      break;
    case PLANE_YZ:
      writeBlock(gPlaneModal.format(19), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), "R" + rFormat.format(r), getFeed(feed));
      break;
    default:
      if (getProperty("allow3DArcs")) {
        // make sure maximumCircularSweep is well below 360deg
        // we could use G02.4 or G03.4 - direction is calculated
        var ip = getPositionU(0.5);
        writeBlock(gMotionModal.format(clockwise ? 2.4 : 3.4), xOutput.format(ip.x), yOutput.format(ip.y), zOutput.format(ip.z), getFeed(feed));
        writeBlock(xOutput.format(x), yOutput.format(y), zOutput.format(z));
      } else {
        linearize(tolerance);
      }
    }
  }
}
// <<<<< INCLUDED FROM include_files/motionFunctions_fanuc.cpi
// >>>>> INCLUDED FROM include_files/parametricFeeds.cpi
var activeMovements;
var currentFeedId;
validate(settings.parametricFeeds, "Setting 'parametricFeeds' is required but not defined.");
function initializeParametricFeeds(insertToolCall) {
  if (getProperty("useParametricFeed") && getParameter("operation-strategy") != "drill" && !currentSection.hasAnyCycle()) {
    if (!insertToolCall && activeMovements && (getCurrentSectionId() > 0) &&
      ((getPreviousSection().getPatternId() == currentSection.getPatternId()) && (currentSection.getPatternId() != 0))) {
      return; // use the current feeds
    }
  } else {
    activeMovements = undefined;
    return;
  }

  activeMovements = new Array();
  var movements = currentSection.getMovements();

  var id = 0;
  var activeFeeds = new Array();
  if (hasParameter("operation:tool_feedCutting")) {
    if (movements & ((1 << MOVEMENT_CUTTING) | (1 << MOVEMENT_LINK_TRANSITION) | (1 << MOVEMENT_EXTENDED))) {
      var feedContext = new FeedContext(id, localize("Cutting"), getParameter("operation:tool_feedCutting"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_CUTTING] = feedContext;
      activeMovements[MOVEMENT_LINK_TRANSITION] = feedContext;
      activeMovements[MOVEMENT_EXTENDED] = feedContext;
    }
    ++id;
    if (movements & (1 << MOVEMENT_PREDRILL)) {
      feedContext = new FeedContext(id, localize("Predrilling"), getParameter("operation:tool_feedCutting"));
      activeMovements[MOVEMENT_PREDRILL] = feedContext;
      activeFeeds.push(feedContext);
    }
    ++id;
  }

  if (hasParameter("operation:finishFeedrate")) {
    if (movements & (1 << MOVEMENT_FINISH_CUTTING)) {
      var feedContext = new FeedContext(id, localize("Finish"), getParameter("operation:finishFeedrate"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_FINISH_CUTTING] = feedContext;
    }
    ++id;
  } else if (hasParameter("operation:tool_feedCutting")) {
    if (movements & (1 << MOVEMENT_FINISH_CUTTING)) {
      var feedContext = new FeedContext(id, localize("Finish"), getParameter("operation:tool_feedCutting"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_FINISH_CUTTING] = feedContext;
    }
    ++id;
  }

  if (hasParameter("operation:tool_feedEntry")) {
    if (movements & (1 << MOVEMENT_LEAD_IN)) {
      var feedContext = new FeedContext(id, localize("Entry"), getParameter("operation:tool_feedEntry"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_LEAD_IN] = feedContext;
    }
    ++id;
  }

  if (hasParameter("operation:tool_feedExit")) {
    if (movements & (1 << MOVEMENT_LEAD_OUT)) {
      var feedContext = new FeedContext(id, localize("Exit"), getParameter("operation:tool_feedExit"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_LEAD_OUT] = feedContext;
    }
    ++id;
  }

  if (hasParameter("operation:noEngagementFeedrate")) {
    if (movements & (1 << MOVEMENT_LINK_DIRECT)) {
      var feedContext = new FeedContext(id, localize("Direct"), getParameter("operation:noEngagementFeedrate"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_LINK_DIRECT] = feedContext;
    }
    ++id;
  } else if (hasParameter("operation:tool_feedCutting") &&
             hasParameter("operation:tool_feedEntry") &&
             hasParameter("operation:tool_feedExit")) {
    if (movements & (1 << MOVEMENT_LINK_DIRECT)) {
      var feedContext = new FeedContext(id, localize("Direct"), Math.max(getParameter("operation:tool_feedCutting"), getParameter("operation:tool_feedEntry"), getParameter("operation:tool_feedExit")));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_LINK_DIRECT] = feedContext;
    }
    ++id;
  }

  if (hasParameter("operation:reducedFeedrate")) {
    if (movements & (1 << MOVEMENT_REDUCED)) {
      var feedContext = new FeedContext(id, localize("Reduced"), getParameter("operation:reducedFeedrate"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_REDUCED] = feedContext;
    }
    ++id;
  }

  if (hasParameter("operation:tool_feedRamp")) {
    if (movements & ((1 << MOVEMENT_RAMP) | (1 << MOVEMENT_RAMP_HELIX) | (1 << MOVEMENT_RAMP_PROFILE) | (1 << MOVEMENT_RAMP_ZIG_ZAG))) {
      var feedContext = new FeedContext(id, localize("Ramping"), getParameter("operation:tool_feedRamp"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_RAMP] = feedContext;
      activeMovements[MOVEMENT_RAMP_HELIX] = feedContext;
      activeMovements[MOVEMENT_RAMP_PROFILE] = feedContext;
      activeMovements[MOVEMENT_RAMP_ZIG_ZAG] = feedContext;
    }
    ++id;
  }
  if (hasParameter("operation:tool_feedPlunge")) {
    if (movements & (1 << MOVEMENT_PLUNGE)) {
      var feedContext = new FeedContext(id, localize("Plunge"), getParameter("operation:tool_feedPlunge"));
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_PLUNGE] = feedContext;
    }
    ++id;
  }
  if (true) { // high feed
    if ((movements & (1 << MOVEMENT_HIGH_FEED)) || (highFeedMapping != HIGH_FEED_NO_MAPPING)) {
      var feed;
      if (hasParameter("operation:highFeedrateMode") && getParameter("operation:highFeedrateMode") != "disabled") {
        feed = getParameter("operation:highFeedrate");
      } else {
        feed = this.highFeedrate;
      }
      var feedContext = new FeedContext(id, localize("High Feed"), feed);
      activeFeeds.push(feedContext);
      activeMovements[MOVEMENT_HIGH_FEED] = feedContext;
      activeMovements[MOVEMENT_RAPID] = feedContext;
    }
    ++id;
  }

  for (var i = 0; i < activeFeeds.length; ++i) {
    var feedContext = activeFeeds[i];
    var feedDescription = typeof formatComment == "function" ? formatComment(feedContext.description) : feedContext.description;
    writeBlock(settings.parametricFeeds.feedAssignmentVariable + (settings.parametricFeeds.firstFeedParameter + feedContext.id) + "=" + feedFormat.format(feedContext.feed) + SP + feedDescription);
  }
}

function FeedContext(id, description, feed) {
  this.id = id;
  this.description = description;
  this.feed = feed;
}
// <<<<< INCLUDED FROM include_files/parametricFeeds.cpi
// >>>>> INCLUDED FROM include_files/coolant.cpi
var currentCoolantMode = COOLANT_OFF;
var coolantOff = undefined;
var isOptionalCoolant = false;
var forceCoolant = false;

function setCoolant(coolant) {
  var coolantCodes = getCoolantCodes(coolant);
  if (Array.isArray(coolantCodes)) {
    if (settings.coolant.singleLineCoolant) {
      skipBlock = isOptionalCoolant;
      writeBlock(coolantCodes.join(getWordSeparator()));
    } else {
      for (var c in coolantCodes) {
        skipBlock = isOptionalCoolant;
        writeBlock(coolantCodes[c]);
      }
    }
    return undefined;
  }
  return coolantCodes;
}

function getCoolantCodes(coolant, format) {
  isOptionalCoolant = false;
  if (typeof operationNeedsSafeStart == "undefined") {
    operationNeedsSafeStart = false;
  }
  var multipleCoolantBlocks = new Array(); // create a formatted array to be passed into the outputted line
  var coolants = settings.coolant.coolants;
  if (!coolants) {
    error(localize("Coolants have not been defined."));
  }
  if (tool.type == TOOL_PROBE) { // avoid coolant output for probing
    coolant = COOLANT_OFF;
  }
  if (coolant == currentCoolantMode) {
    if (operationNeedsSafeStart && coolant != COOLANT_OFF) {
      isOptionalCoolant = true;
    } else if (!forceCoolant || coolant == COOLANT_OFF) {
      return undefined; // coolant is already active
    }
  }
  if ((coolant != COOLANT_OFF) && (currentCoolantMode != COOLANT_OFF) && (coolantOff != undefined) && !forceCoolant && !isOptionalCoolant) {
    if (Array.isArray(coolantOff)) {
      for (var i in coolantOff) {
        multipleCoolantBlocks.push(coolantOff[i]);
      }
    } else {
      multipleCoolantBlocks.push(coolantOff);
    }
  }
  forceCoolant = false;

  var m;
  var coolantCodes = {};
  for (var c in coolants) { // find required coolant codes into the coolants array
    if (coolants[c].id == coolant) {
      coolantCodes.on = coolants[c].on;
      if (coolants[c].off != undefined) {
        coolantCodes.off = coolants[c].off;
        break;
      } else {
        for (var i in coolants) {
          if (coolants[i].id == COOLANT_OFF) {
            coolantCodes.off = coolants[i].off;
            break;
          }
        }
      }
    }
  }
  if (coolant == COOLANT_OFF) {
    m = !coolantOff ? coolantCodes.off : coolantOff; // use the default coolant off command when an 'off' value is not specified
  } else {
    coolantOff = coolantCodes.off;
    m = coolantCodes.on;
  }

  if (!m) {
    onUnsupportedCoolant(coolant);
    m = 9;
  } else {
    if (Array.isArray(m)) {
      for (var i in m) {
        multipleCoolantBlocks.push(m[i]);
      }
    } else {
      multipleCoolantBlocks.push(m);
    }
    currentCoolantMode = coolant;
    for (var i in multipleCoolantBlocks) {
      if (typeof multipleCoolantBlocks[i] == "number") {
        multipleCoolantBlocks[i] = mFormat.format(multipleCoolantBlocks[i]);
      }
    }
    if (format == undefined || format) {
      return multipleCoolantBlocks; // return the single formatted coolant value
    } else {
      return m; // return unformatted coolant value
    }
  }
  return undefined;
}
// <<<<< INCLUDED FROM include_files/coolant.cpi
// >>>>> INCLUDED FROM include_files/writeRetract_fanuc.cpi
validate(settings.retract, "Setting 'retract' is required but not defined.");
function writeRetract() {
  var words = []; // store all retracted axes in an array
  var retractAxes = new Array(false, false, false);
  var method = getProperty("safePositionMethod");
  if (method == "clearanceHeight") {
    if (!is3D()) {
      error(localize("Safe retract option 'Clearance Height' is only supported when all operations are along the setup Z-axis."));
    }
    return;
  }
  validate(arguments.length != 0, "No axis specified for writeRetract().");

  for (i in arguments) {
    retractAxes[arguments[i]] = true;
  }
  if ((retractAxes[0] || retractAxes[1]) && !retracted) { // retract Z first before moving to X/Y home
    error(localize("Retracting in X/Y is not possible without being retracted in Z."));
    return;
  }
  // special conditions
  if (settings.retract.methodXY != undefined &&
    (retractAxes[0] && !machineConfiguration.hasHomePositionX() || (retractAxes[1] && !machineConfiguration.hasHomePositionY()))) {
    method = settings.retract.methodXY;
  }
  if (retractAxes[2] && settings.retract.methodZ != undefined) {
    method = settings.retract.methodZ;
  }

  if (gRotationModal.getCurrent() == 68 && settings.retract.cancelRotationOnRetracting) { // cancel rotation before retracting
    cancelWorkPlane(true);
  }

  // define home positions
  var _xHome;
  var _yHome;
  var _zHome;
  if (method == "G28") {
    _xHome = toPreciseUnit(0, MM);
    _yHome = toPreciseUnit(0, MM);
    _zHome = toPreciseUnit(0, MM);
  } else {
    _xHome = machineConfiguration.hasHomePositionX() ? machineConfiguration.getHomePositionX() : toPreciseUnit(0, MM);
    _yHome = machineConfiguration.hasHomePositionY() ? machineConfiguration.getHomePositionY() : toPreciseUnit(0, MM);
    _zHome = machineConfiguration.getRetractPlane() != 0 ? machineConfiguration.getRetractPlane() : toPreciseUnit(0, MM);
  }
  for (var i = 0; i < arguments.length; ++i) {
    switch (arguments[i]) {
    case X:
      words.push("X" + xyzFormat.format(_xHome));
      xOutput.reset();
      break;
    case Y:
      words.push("Y" + xyzFormat.format(_yHome));
      yOutput.reset();
      break;
    case Z:
      words.push("Z" + xyzFormat.format(_zHome));
      zOutput.reset();
      retracted = !skipBlock;
      break;
    default:
      error(localize("Unsupported axis specified for writeRetract()."));
      return;
    }
  }
  if (words.length > 0) {
    switch (method) {
    case "G28":
      gMotionModal.reset();
      gAbsIncModal.reset();
      writeBlock(gFormat.format(28), gAbsIncModal.format(91), words);
      writeBlock(gAbsIncModal.format(90));
      break;
    case "G53":
      gMotionModal.reset();
      writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), words);
      break;
    default:
      error(localize("Unsupported safe position method." + method));
      return;
    }
  }
}
// <<<<< INCLUDED FROM include_files/writeRetract_fanuc.cpi
// >>>>> INCLUDED FROM include_files/initialPositioning_fanuc.cpi
Matrix.getOrientationFromDirection = function (ijk) {
  var forward = ijk;
  var unitZ = new Vector(0, 0, 1);
  var W;
  if (Math.abs(Vector.dot(forward, unitZ)) < 0.5) {
    var imX = Vector.cross(forward, unitZ).getNormalized();
    W = new Matrix(imX, Vector.cross(forward, imX), forward);
  } else {
    var imX = Vector.cross(new Vector(0, 1, 0), forward).getNormalized();
    W = new Matrix(imX, Vector.cross(forward, imX), forward);
  }
  return W;
};

function writeInitialPositioning(position, abc, _skipBlock) {
  skipBlock = _skipBlock;
  if (false && currentSection.isMultiAxis() && settings.workPlaneMethod.useTiltedWorkplane) {
    var W;
    if (machineConfiguration.isMultiAxisConfiguration()) {
      W = machineConfiguration.getOrientation(abc);
    } else {
      W = Matrix.getOrientationFromDirection(currentSection.getGlobalInitialToolAxis());
    }
    var angles = settings.workPlaneMethod.eulerConvention != undefined ? W.getEuler2(settings.workPlaneMethod.eulerConvention) : abc;
    if (angles.isNonZero()) {
      setWorkPlane(angles);
      var prePosition = W.getTransposed().multiply(position);
      writeBlock(gAbsIncModal.format(90), gMotionModal.format(0), xOutput.format(prePosition.x), yOutput.format(prePosition.y));
      cancelWorkPlane();
      writeBlock(gMotionModal.format(0), gFormat.format(getOffsetCode()), zOutput.format(position.z), hFormat.format(tool.lengthOffset));
      lengthCompensationActive = true;
      zIsOutput = true;
    }
  } else {
    if (machineConfiguration.isHeadConfiguration()) {
      writeBlock(gAbsIncModal.format(90), gMotionModal.format(0), gFormat.format(getOffsetCode()),
        xOutput.format(position.x), yOutput.format(position.y), zOutput.format(position.z), hFormat.format(tool.lengthOffset)
      );
    } else {
      writeBlock(gAbsIncModal.format(90), gMotionModal.format(0), xOutput.format(position.x), yOutput.format(position.y));
      skipBlock = _skipBlock;
      writeBlock(gMotionModal.format(0), gFormat.format(getOffsetCode()), zOutput.format(position.z), hFormat.format(tool.lengthOffset));
    }
    lengthCompensationActive = true;
    zIsOutput = true;
    gMotionModal.reset();
    if (_skipBlock) {
      if (getCurrentPosition().z < position.z) {
        zOutput.reset();
        writeBlock(gMotionModal.format(0), zOutput.format(position.z));
        zIsOutput = true;
      }
      forceXYZ();
      writeBlock(gAbsIncModal.format(90), gMotionModal.format(0), xOutput.format(position.x), yOutput.format(position.y));
    }
  }
}
// <<<<< INCLUDED FROM include_files/initialPositioning_fanuc.cpi
// >>>>> INCLUDED FROM include_files/getOffsetCode_fanuc.cpi
function getOffsetCode() {
  // assumes a head configuration uses TCP on a Fanuc controller
  var offsetCode = 43;
  if (currentSection.isMultiAxis()) {
    if (machineConfiguration.isMultiAxisConfiguration() && operationSupportsTCP) {
      offsetCode = 43.4;
    } else if (!machineConfiguration.isMultiAxisConfiguration()) {
      offsetCode = 43.5;
    }
  }
  return offsetCode;
}
// <<<<< INCLUDED FROM include_files/getOffsetCode_fanuc.cpi
// >>>>> INCLUDED FROM include_files/smoothing.cpi
// collected state below, do not edit
validate(settings.smoothing, "Setting 'smoothing' is required but not defined.");
var smoothing = {
  cancel     : false, // cancel tool length prior to update smoothing for this operation
  isActive   : false, // the current state of smoothing
  isAllowed  : false, // smoothing is allowed for this operation
  isDifferent: false, // tells if smoothing levels/tolerances/both are different between operations
  level      : -1, // the active level of smoothing
  tolerance  : -1, // the current operation tolerance
  force      : false // smoothing needs to be forced out in this operation
};

function initializeSmoothing() {
  var smoothingSettings = settings.smoothing;
  var previousLevel = smoothing.level;
  var previousTolerance = smoothing.tolerance;

  // determine new smoothing levels and tolerances
  smoothing.level = parseInt(getProperty("useSmoothing"), 10);
  smoothing.level = isNaN(smoothing.level) ? -1 : smoothing.level;
  smoothing.tolerance = Math.max(getParameter("operation:tolerance", smoothingSettings.thresholdFinishing), 0);

  // automatically determine smoothing level
  if (smoothing.level == 9999) {
    if (smoothingSettings.autoLevelCriteria == "stock") { // determine auto smoothing level based on stockToLeave
      var stockToLeave = xyzFormat.getResultingValue(getParameter("operation:stockToLeave", 0));
      var verticalStockToLeave = xyzFormat.getResultingValue(getParameter("operation:verticalStockToLeave", 0));
      if (((stockToLeave >= smoothingSettings.thresholdRoughing) && (verticalStockToLeave >= smoothingSettings.thresholdRoughing)) ||
          getParameter("operation:strategy", "") == "face") {
        smoothing.level = smoothingSettings.roughing; // set roughing level
      } else {
        if (((stockToLeave >= smoothingSettings.thresholdSemiFinishing) && (stockToLeave < smoothingSettings.thresholdRoughing)) &&
          ((verticalStockToLeave >= smoothingSettings.thresholdSemiFinishing) && (verticalStockToLeave  < smoothingSettings.thresholdRoughing))) {
          smoothing.level = smoothingSettings.semi; // set semi level
        } else if (((stockToLeave >= smoothingSettings.thresholdFinishing) && (stockToLeave < smoothingSettings.thresholdSemiFinishing)) &&
          ((verticalStockToLeave >= smoothingSettings.thresholdFinishing) && (verticalStockToLeave  < smoothingSettings.thresholdSemiFinishing))) {
          smoothing.level = smoothingSettings.semifinishing; // set semi-finishing level
        } else {
          smoothing.level = smoothingSettings.finishing; // set finishing level
        }
      }
    } else { // detemine auto smoothing level based on operation tolerance instead of stockToLeave
      if (smoothing.tolerance >= smoothingSettings.thresholdRoughing ||
          getParameter("operation:strategy", "") == "face") {
        smoothing.level = smoothingSettings.roughing; // set roughing level
      } else {
        if (((smoothing.tolerance >= smoothingSettings.thresholdSemiFinishing) && (smoothing.tolerance < smoothingSettings.thresholdRoughing))) {
          smoothing.level = smoothingSettings.semi; // set semi level
        } else if (((smoothing.tolerance >= smoothingSettings.thresholdFinishing) && (smoothing.tolerance < smoothingSettings.thresholdSemiFinishing))) {
          smoothing.level = smoothingSettings.semifinishing; // set semi-finishing level
        } else {
          smoothing.level = smoothingSettings.finishing; // set finishing level
        }
      }
    }
  }

  if (smoothing.level == -1) { // useSmoothing is disabled
    smoothing.isAllowed = false;
  } else { // do not output smoothing for the following operations
    smoothing.isAllowed = !(currentSection.getTool().type == TOOL_PROBE || currentSection.checkGroup(STRATEGY_DRILLING));
  }
  if (!smoothing.isAllowed) {
    smoothing.level = -1;
    smoothing.tolerance = -1;
  }

  switch (smoothingSettings.differenceCriteria) {
  case "level":
    smoothing.isDifferent = smoothing.level != previousLevel;
    break;
  case "tolerance":
    smoothing.isDifferent = smoothing.tolerance != previousTolerance;
    break;
  case "both":
    smoothing.isDifferent = smoothing.level != previousLevel || smoothing.tolerance != previousTolerance;
    break;
  default:
    error(localize("Unsupported smoothing criteria."));
    return;
  }

  // tool length compensation needs to be canceled when smoothing state/level changes
  if (smoothingSettings.cancelCompensation) {
    smoothing.cancel = !isFirstSection() && smoothing.isDifferent;
  }
}
// <<<<< INCLUDED FROM include_files/smoothing.cpi
// >>>>> INCLUDED FROM include_files/writeProgramHeader.cpi
function writeProgramHeader() {
  // dump machine configuration
  var vendor = machineConfiguration.getVendor();
  var model = machineConfiguration.getModel();
  var mDescription = machineConfiguration.getDescription();
  if (getProperty("writeMachine") && (vendor || model || mDescription)) {
    writeComment(localize("Machine"));
    if (vendor) {
      writeComment("  " + localize("vendor") + ": " + vendor);
    }
    if (model) {
      writeComment("  " + localize("model") + ": " + model);
    }
    if (mDescription) {
      writeComment("  " + localize("description") + ": "  + mDescription);
    }
  }

  // dump tool information
  if (getProperty("writeTools")) {
    if (false) { // set to true to use the post kernel version of the tool list
      writeToolTable(TOOL_NUMBER_COL);
    } else {
      var zRanges = {};
      if (is3D()) {
        var numberOfSections = getNumberOfSections();
        for (var i = 0; i < numberOfSections; ++i) {
          var section = getSection(i);
          var zRange = section.getGlobalZRange();
          var tool = section.getTool();
          if (zRanges[tool.number]) {
            zRanges[tool.number].expandToRange(zRange);
          } else {
            zRanges[tool.number] = zRange;
          }
        }
      }
      var tools = getToolTable();
      if (tools.getNumberOfTools() > 0) {
        for (var i = 0; i < tools.getNumberOfTools(); ++i) {
          var tool = tools.getTool(i);
          var comment = "T" + toolFormat.format(tool.number) + " " +
          "D=" + xyzFormat.format(tool.diameter) + " " +
          localize("CR") + "=" + xyzFormat.format(tool.cornerRadius);
          if ((tool.taperAngle > 0) && (tool.taperAngle < Math.PI)) {
            comment += " " + localize("TAPER") + "=" + taperFormat.format(tool.taperAngle) + localize("deg");
          }
          if (zRanges[tool.number]) {
            comment += " - " + localize("ZMIN") + "=" + xyzFormat.format(zRanges[tool.number].getMinimum());
          }
          comment += " - " + getToolTypeName(tool.type);
          writeComment(comment);
        }
      }
    }
  }
}
// <<<<< INCLUDED FROM include_files/writeProgramHeader.cpi
// >>>>> INCLUDED FROM include_files/writeProgramNumber_fanuc.cpi
function writeProgramNumber() {
  if (programName) {
    var programId;
    try {
      programId = getAsInt(programName);
    } catch (e) {
      error(localize("Program name must be a number."));
      return;
    }
    if (!((programId >= 1) && (programId <= getProperty("o8") ? 99999999 : 9999))) {
      error(localize("Program number is out of range."));
      return;
    }
    if ((programId >= 8000) && (programId <= 9999)) {
      warning(localize("Program number is reserved by tool builder."));
    }

    oFormat = createFormat({width:(getProperty("o8") ? 8 : 4), zeropad:true, decimals:0});
    writeln("O" + oFormat.format(programId) + conditional(programComment, " " + formatComment(programComment)));
    if (typeof lastSubprogram != "undefined") {
      lastSubprogram = programId;
    }
  } else {
    error(localize("Program name has not been specified."));
    return;
  }
}
// <<<<< INCLUDED FROM include_files/writeProgramNumber_fanuc.cpi

// >>>>> INCLUDED FROM include_files/drillCycles_fanuc.cpi
function writeDrillCycle(cycle, x, y, z) {
  if (!isSameDirection(getRotation().forward, new Vector(0, 0, 1))) {
    expandCyclePoint(x, y, z);
    return;
  }
  if (isFirstCyclePoint()) {
    // return to initial Z which is clearance plane and set absolute mode
    repositionToCycleClearance(cycle, x, y, z);

    var F = getProperty("useG95") ? (cycle.feedrate / spindleSpeed) : cycle.feedrate;
    var P = !cycle.dwell ? 0 : clamp(1, cycle.dwell * 1000, 99999999); // in milliseconds
    switch (cycleType) {
    case "drilling":
      writeBlock(
        gRetractModal.format(98), gCycleModal.format(81),
        getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
        feedOutput.format(F)
      );
      break;
    case "counter-boring":
      if (P > 0) {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(82),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P),
          feedOutput.format(F)
        );
      } else {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(81),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          feedOutput.format(F)
        );
      }
      break;
    case "chip-breaking":
      if ((cycle.accumulatedDepth < cycle.depth) || (P > 0)) {
        expandCyclePoint(x, y, z);
      } else {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(73),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          peckOutput.format(cycle.incrementalDepth),
          feedOutput.format(F)
        );
      }
      break;
    case "deep-drilling":
      if (P > 0) {
        expandCyclePoint(x, y, z);
      } else {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(83),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          peckOutput.format(cycle.incrementalDepth),
          // conditional(P > 0, "P" + milliFormat.format(P)),
          feedOutput.format(F)
        );
      }
      break;
    case "tapping":
      if (getProperty("useRigidTapping") != "no") {
        writeBlock(mFormat.format(29), sOutput.format(spindleSpeed));
      }
      if (getProperty("usePitchForTapping")) {
        writeBlock(
          gRetractModal.format(98), gFeedModeModal.format(95), gCycleModal.format((tool.type == TOOL_TAP_LEFT_HAND) ? 74 : 84),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P),
          pitchOutput.format(tool.threadPitch)
        );
        forceFeed();
      } else {
        var tappingFPM = tool.getThreadPitch() * rpmFormat.getResultingValue(spindleSpeed);
        F = (getProperty("useG95") ? tool.getThreadPitch() : tappingFPM);
        writeBlock(
          gRetractModal.format(98), gCycleModal.format((tool.type == TOOL_TAP_LEFT_HAND) ? 74 : 84),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P),
          feedOutput.format(F)
        );
      }
      break;
    case "left-tapping":
      if (getProperty("useRigidTapping") != "no") {
        writeBlock(mFormat.format(29), sOutput.format(spindleSpeed));
      }
      if (getProperty("usePitchForTapping")) {
        writeBlock(
          gRetractModal.format(98), gFeedModeModal.format(95), gCycleModal.format(74),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P),
          pitchOutput.format(tool.threadPitch)
        );
        forceFeed();
      } else {
        var tappingFPM = tool.getThreadPitch() * rpmFormat.getResultingValue(spindleSpeed);
        F = (getProperty("useG95") ? tool.getThreadPitch() : tappingFPM);
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(74),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P),
          feedOutput.format(F)
        );
      }
      break;
    case "right-tapping":
      if (getProperty("useRigidTapping") != "no") {
        writeBlock(mFormat.format(29), sOutput.format(spindleSpeed));
      }
      if (getProperty("usePitchForTapping")) {
        writeBlock(
          gRetractModal.format(98), gFeedModeModal.format(95), gCycleModal.format(84),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P),
          pitchOutput.format(tool.threadPitch)
        );
        forceFeed();
      } else {
        var tappingFPM = tool.getThreadPitch() * rpmFormat.getResultingValue(spindleSpeed);
        F = (getProperty("useG95") ? tool.getThreadPitch() : tappingFPM);
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(84),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P),
          feedOutput.format(F)
        );
      }
      break;
    case "tapping-with-chip-breaking":
    case "left-tapping-with-chip-breaking":
    case "right-tapping-with-chip-breaking":
      if (cycle.accumulatedDepth < cycle.depth) {
        error(localize("Accumulated pecking depth is not supported for tapping cycles with chip breaking."));
        return;
      } else {
        if (getProperty("useRigidTapping") != "no") {
          writeBlock(mFormat.format(29), sOutput.format(spindleSpeed));
        }
        if (getProperty("usePitchForTapping")) {
          writeBlock(
            gRetractModal.format(98), gFeedModeModal.format(95), gCycleModal.format((tool.type == TOOL_TAP_LEFT_HAND ? 74 : 84)),
            getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
            "P" + milliFormat.format(P),
            peckOutput.format(cycle.incrementalDepth),
            pitchOutput.format(tool.threadPitch)
          );
          forceFeed();
        } else {
          var tappingFPM = tool.getThreadPitch() * rpmFormat.getResultingValue(spindleSpeed);
          F = (getProperty("useG95") ? tool.getThreadPitch() : tappingFPM);
          writeBlock(
            gRetractModal.format(98), gCycleModal.format((tool.type == TOOL_TAP_LEFT_HAND ? 74 : 84)),
            getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
            "P" + milliFormat.format(P),
            peckOutput.format(cycle.incrementalDepth),
            feedOutput.format(F)
          );
        }
      }
      break;
    case "fine-boring":
      writeBlock(
        gRetractModal.format(98), gCycleModal.format(76),
        getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
        "P" + milliFormat.format(P), // not optional
        "Q" + xyzFormat.format(cycle.shift),
        feedOutput.format(F)
      );
      break;
    case "back-boring":
      var dx = (gPlaneModal.getCurrent() == 19) ? cycle.backBoreDistance : 0;
      var dy = (gPlaneModal.getCurrent() == 18) ? cycle.backBoreDistance : 0;
      var dz = (gPlaneModal.getCurrent() == 17) ? cycle.backBoreDistance : 0;
      writeBlock(
        gRetractModal.format(98), gCycleModal.format(87),
        getCommonCycle(x - dx, y - dy, z - dz, cycle.bottom, cycle.clearance),
        "Q" + xyzFormat.format(cycle.shift),
        "P" + milliFormat.format(P), // not optional
        feedOutput.format(F)
      );
      break;
    case "reaming":
      if (feedFormat.getResultingValue(cycle.feedrate) != feedFormat.getResultingValue(cycle.retractFeedrate)) {
        expandCyclePoint(x, y, z);
        break;
      }
      if (P > 0) {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(89),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P),
          feedOutput.format(F)
        );
      } else {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(85),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          feedOutput.format(F)
        );
      }
      break;
    case "stop-boring":
      if (P > 0) {
        expandCyclePoint(x, y, z);
      } else {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(86),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          feedOutput.format(F)
        );
      }
      break;
    case "manual-boring":
      writeBlock(
        gRetractModal.format(98), gCycleModal.format(88),
        getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
        "P" + milliFormat.format(P), // not optional
        feedOutput.format(F)
      );
      break;
    case "boring":
      if (feedFormat.getResultingValue(cycle.feedrate) != feedFormat.getResultingValue(cycle.retractFeedrate)) {
        expandCyclePoint(x, y, z);
        break;
      }
      if (P > 0) {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(89),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          "P" + milliFormat.format(P), // not optional
          feedOutput.format(F)
        );
      } else {
        writeBlock(
          gRetractModal.format(98), gCycleModal.format(85),
          getCommonCycle(x, y, z, cycle.retract, cycle.clearance),
          feedOutput.format(F)
        );
      }
      break;
    default:
      expandCyclePoint(x, y, z);
    }
    // place cycle operation in subprogram
    if (cycleSubprogramIsActive) {
      if (cycleExpanded || isProbeOperation()) {
        cycleSubprogramIsActive = false;
      } else {
      // call subprogram
        subprogramCall();
        subprogramStart(new Vector(x, y, z), new Vector(0, 0, 0), false);
      }
    }
    if (incrementalMode) { // set current position to clearance height
      setCyclePosition(cycle.clearance);
    }
  } else {
    if (cycleExpanded) {
      expandCyclePoint(x, y, z);
    } else {
      if (!xyzFormat.areDifferent(x, xOutput.getCurrent()) &&
          !xyzFormat.areDifferent(y, yOutput.getCurrent()) &&
          !xyzFormat.areDifferent(z, zOutput.getCurrent())) {
        switch (gPlaneModal.getCurrent()) {
        case 17: // XY
          xOutput.reset(); // at least one axis is required
          break;
        case 18: // ZX
          zOutput.reset(); // at least one axis is required
          break;
        case 19: // YZ
          yOutput.reset(); // at least one axis is required
          break;
        }
      }
      if (incrementalMode) { // set current position to retract height
        setCyclePosition(cycle.retract);
      }
      writeBlock(xOutput.format(x), yOutput.format(y), zOutput.format(z));
      if (incrementalMode) { // set current position to clearance height
        setCyclePosition(cycle.clearance);
      }
    }
  }
}

function getCommonCycle(x, y, z, r, c) {
  forceXYZ(); // force xyz on first drill hole of any cycle
  if (incrementalMode) {
    zOutput.format(c);
    return [xOutput.format(x), yOutput.format(y),
      "Z" + xyzFormat.format(z - r),
      "R" + xyzFormat.format(r - c)];
  } else {
    return [xOutput.format(x), yOutput.format(y),
      zOutput.format(z),
      "R" + xyzFormat.format(r)];
  }
}

function setCyclePosition(_position) {
  switch (gPlaneModal.getCurrent()) {
  case 17: // XY
    zOutput.format(_position);
    break;
  case 18: // ZX
    yOutput.format(_position);
    break;
  case 19: // YZ
    xOutput.format(_position);
    break;
  }
}
// <<<<< INCLUDED FROM include_files/drillCycles_fanuc.cpi

// >>>>> INCLUDED FROM include_files/commonInspectionFunctions_fanuc.cpi
var isDPRNTopen = false;
function inspectionCreateResultsFileHeader() {
  if (isDPRNTopen) {
    if (!getProperty("singleResultsFile")) {
      writeln("DPRNT[END]");
      writeBlock("PCLOS");
      isDPRNTopen = false;
    }
  }

  if (isProbeOperation() && !printProbeResults()) {
    return; // if print results is not desired by probe/ probeWCS
  }

  if (!isDPRNTopen) {
    writeBlock("PCLOS");
    writeBlock("POPEN");
    // check for existence of none alphanumeric characters but not spaces
    var resFile;
    if (getProperty("singleResultsFile")) {
      resFile = getParameter("job-description") + "-RESULTS";
    } else {
      resFile = getParameter("operation-comment") + "-RESULTS";
    }
    resFile = resFile.replace(/:/g, "-");
    resFile = resFile.replace(/[^a-zA-Z0-9 -]/g, "");
    resFile = resFile.replace(/\s/g, "-");
    resFile = resFile.toUpperCase();
    writeln("DPRNT[START]");
    writeln("DPRNT[RESULTSFILE*" + resFile + "]");
    if (hasGlobalParameter("document-id")) {
      writeln("DPRNT[DOCUMENTID*" + getGlobalParameter("document-id").toUpperCase() + "]");
    }
    if (hasGlobalParameter("model-version")) {
      writeln("DPRNT[MODELVERSION*" + getGlobalParameter("model-version").toUpperCase() + "]");
    }
  }
  if (isProbeOperation() && printProbeResults()) {
    isDPRNTopen = true;
  }
}

function getPointNumber() {
  if (typeof inspectionWriteVariables == "function") {
    return (inspectionVariables.pointNumber);
  } else {
    return ("#122[60]");
  }
}

function inspectionWriteCADTransform() {
  var cadOrigin = currentSection.getModelOrigin();
  var cadWorkPlane = currentSection.getModelPlane().getTransposed();
  var cadEuler = cadWorkPlane.getEuler2(EULER_XYZ_S);
  writeln(
    "DPRNT[G331" +
    "*N" + getPointNumber() +
    "*A" + abcFormat.format(cadEuler.x) +
    "*B" + abcFormat.format(cadEuler.y) +
    "*C" + abcFormat.format(cadEuler.z) +
    "*X" + xyzFormat.format(-cadOrigin.x) +
    "*Y" + xyzFormat.format(-cadOrigin.y) +
    "*Z" + xyzFormat.format(-cadOrigin.z) +
    "]"
  );
}

function inspectionWriteWorkplaneTransform() {
  var orientation = machineConfiguration.isMultiAxisConfiguration() ? machineConfiguration.getOrientation(getCurrentDirection()) : currentSection.workPlane;
  var abc = orientation.getEuler2(EULER_XYZ_S);
  writeln("DPRNT[G330" +
    "*N" + getPointNumber() +
    "*A" + abcFormat.format(abc.x) +
    "*B" + abcFormat.format(abc.y) +
    "*C" + abcFormat.format(abc.z) +
    "*X0*Y0*Z0*I0*R0]"
  );
}

function writeProbingToolpathInformation(cycleDepth) {
  writeln("DPRNT[TOOLPATHID*" + getParameter("autodeskcam:operation-id") + "]");
  if (isInspectionOperation()) {
    writeln("DPRNT[TOOLPATH*" + getParameter("operation-comment").toUpperCase().replace(/[()]/g, "") + "]");
  } else {
    writeln("DPRNT[CYCLEDEPTH*" + xyzFormat.format(cycleDepth) + "]");
  }
}
// <<<<< INCLUDED FROM include_files/commonInspectionFunctions_fanuc.cpi
// >>>>> INCLUDED FROM include_files/probeCycles_renishaw.cpi
validate(settings.probing, "Setting 'probing' is required but not defined.");
var probeVariables = {
  outputRotationCodes: false, // determines if it is required to output rotation codes
  compensationXY     : undefined
};
function writeProbeCycle(cycle, x, y, z, P, F) {
  if (isProbeOperation()) {
    if (!settings.workPlaneMethod.useTiltedWorkplane && !isSameDirection(currentSection.workPlane.forward, new Vector(0, 0, 1))) {
      if (!settings.probing.allowIndexingWCSProbing && currentSection.strategy == "probe") {
        error(localize("Updating WCS / work offset using probing is only supported by the CNC in the WCS frame."));
        return;
      }
    }
    if (printProbeResults()) {
      writeProbingToolpathInformation(z - cycle.depth + tool.diameter / 2);
      inspectionWriteCADTransform();
      inspectionWriteWorkplaneTransform();
      if (typeof inspectionWriteVariables == "function") {
        inspectionVariables.pointNumber += 1;
      }
    }
    protectedProbeMove(cycle, x, y, z);
  }

  switch (cycleType) {
  case "probing-x":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9811,
      "X" + xyzFormat.format(x + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter / 2)),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-y":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9811,
      "Y" + xyzFormat.format(y + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter / 2)),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-z":
    protectedProbeMove(cycle, x, y, Math.min(z - cycle.depth + cycle.probeClearance, cycle.retract));
    writeBlock(
      gFormat.format(65), "P" + 9811,
      "Z" + xyzFormat.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-x-wall":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "X" + xyzFormat.format(cycle.width1),
      zOutput.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-y-wall":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "Y" + xyzFormat.format(cycle.width1),
      zOutput.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-x-channel":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "X" + xyzFormat.format(cycle.width1),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      // not required "R" + xyzFormat.format(cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-x-channel-with-island":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "X" + xyzFormat.format(cycle.width1),
      zOutput.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(-cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-y-channel":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "Y" + xyzFormat.format(cycle.width1),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      // not required "R" + xyzFormat.format(cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-y-channel-with-island":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "Y" + xyzFormat.format(cycle.width1),
      zOutput.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(-cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-circular-boss":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9814,
      "D" + xyzFormat.format(cycle.width1),
      "Z" + xyzFormat.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-circular-partial-boss":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9823,
      "A" + xyzFormat.format(cycle.partialCircleAngleA),
      "B" + xyzFormat.format(cycle.partialCircleAngleB),
      "C" + xyzFormat.format(cycle.partialCircleAngleC),
      "D" + xyzFormat.format(cycle.width1),
      "Z" + xyzFormat.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-circular-hole":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9814,
      "D" + xyzFormat.format(cycle.width1),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      // not required "R" + xyzFormat.format(cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-circular-partial-hole":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9823,
      "A" + xyzFormat.format(cycle.partialCircleAngleA),
      "B" + xyzFormat.format(cycle.partialCircleAngleB),
      "C" + xyzFormat.format(cycle.partialCircleAngleC),
      "D" + xyzFormat.format(cycle.width1),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-circular-hole-with-island":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9814,
      "Z" + xyzFormat.format(z - cycle.depth),
      "D" + xyzFormat.format(cycle.width1),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(-cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-circular-partial-hole-with-island":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9823,
      "Z" + xyzFormat.format(z - cycle.depth),
      "A" + xyzFormat.format(cycle.partialCircleAngleA),
      "B" + xyzFormat.format(cycle.partialCircleAngleB),
      "C" + xyzFormat.format(cycle.partialCircleAngleC),
      "D" + xyzFormat.format(cycle.width1),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(-cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-rectangular-hole":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "X" + xyzFormat.format(cycle.width1),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      // not required "R" + xyzFormat.format(-cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "Y" + xyzFormat.format(cycle.width2),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      // not required "R" + xyzFormat.format(-cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-rectangular-boss":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "Z" + xyzFormat.format(z - cycle.depth),
      "X" + xyzFormat.format(cycle.width1),
      "R" + xyzFormat.format(cycle.probeClearance),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, true)
    );
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "Z" + xyzFormat.format(z - cycle.depth),
      "Y" + xyzFormat.format(cycle.width2),
      "R" + xyzFormat.format(cycle.probeClearance),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-rectangular-hole-with-island":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "Z" + xyzFormat.format(z - cycle.depth),
      "X" + xyzFormat.format(cycle.width1),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(-cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    writeBlock(
      gFormat.format(65), "P" + 9812,
      "Z" + xyzFormat.format(z - cycle.depth),
      "Y" + xyzFormat.format(cycle.width2),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(-cycle.probeClearance),
      getProbingArguments(cycle, true)
    );
    break;

  case "probing-xy-inner-corner":
    var cornerX = x + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter / 2);
    var cornerY = y + approach(cycle.approach2) * (cycle.probeClearance + tool.diameter / 2);
    var cornerI = 0;
    var cornerJ = 0;
    if (cycle.probeSpacing !== undefined) {
      cornerI = cycle.probeSpacing;
      cornerJ = cycle.probeSpacing;
    }
    if ((cornerI != 0) && (cornerJ != 0)) {
      if (currentSection.strategy == "probe") {
        setProbeAngleMethod();
        probeVariables.compensationXY = "X[#135] Y[#136]";
      }
    }
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9815, xOutput.format(cornerX), yOutput.format(cornerY),
      conditional(cornerI != 0, "I" + xyzFormat.format(cornerI)),
      conditional(cornerJ != 0, "J" + xyzFormat.format(cornerJ)),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-xy-outer-corner":
    var cornerX = x + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter / 2);
    var cornerY = y + approach(cycle.approach2) * (cycle.probeClearance + tool.diameter / 2);
    var cornerI = 0;
    var cornerJ = 0;
    if (cycle.probeSpacing !== undefined) {
      cornerI = cycle.probeSpacing;
      cornerJ = cycle.probeSpacing;
    }
    if ((cornerI != 0) && (cornerJ != 0)) {
      if (currentSection.strategy == "probe") {
        setProbeAngleMethod();
        probeVariables.compensationXY = "X[#135] Y[#136]";
      }
    }
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9816, xOutput.format(cornerX), yOutput.format(cornerY),
      conditional(cornerI != 0, "I" + xyzFormat.format(cornerI)),
      conditional(cornerJ != 0, "J" + xyzFormat.format(cornerJ)),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, true)
    );
    break;
  case "probing-x-plane-angle":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9843,
      "X" + xyzFormat.format(x + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter / 2)),
      "D" + xyzFormat.format(cycle.probeSpacing),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "A" + xyzFormat.format(cycle.nominalAngle != undefined ? cycle.nominalAngle : 90),
      getProbingArguments(cycle, false)
    );
    if (currentSection.strategy == "probe") {
      setProbeAngleMethod();
      probeVariables.compensationXY = "X" + xyzFormat.format(0) + " Y" + xyzFormat.format(0);
    }
    break;
  case "probing-y-plane-angle":
    protectedProbeMove(cycle, x, y, z - cycle.depth);
    writeBlock(
      gFormat.format(65), "P" + 9843,
      "Y" + xyzFormat.format(y + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter / 2)),
      "D" + xyzFormat.format(cycle.probeSpacing),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "A" + xyzFormat.format(cycle.nominalAngle != undefined ? cycle.nominalAngle : 0),
      getProbingArguments(cycle, false)
    );
    if (currentSection.strategy == "probe") {
      setProbeAngleMethod();
      probeVariables.compensationXY = "X" + xyzFormat.format(0) + " Y" + xyzFormat.format(0);
    }
    break;
  case "probing-xy-pcd-hole":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9819,
      "A" + xyzFormat.format(cycle.pcdStartingAngle),
      "B" + xyzFormat.format(cycle.numberOfSubfeatures),
      "C" + xyzFormat.format(cycle.widthPCD),
      "D" + xyzFormat.format(cycle.widthFeature),
      "K" + xyzFormat.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      getProbingArguments(cycle, false)
    );
    if (cycle.updateToolWear) {
      error(localize("Action -Update Tool Wear- is not supported with this cycle."));
      return;
    }
    break;
  case "probing-xy-pcd-boss":
    protectedProbeMove(cycle, x, y, z);
    writeBlock(
      gFormat.format(65), "P" + 9819,
      "A" + xyzFormat.format(cycle.pcdStartingAngle),
      "B" + xyzFormat.format(cycle.numberOfSubfeatures),
      "C" + xyzFormat.format(cycle.widthPCD),
      "D" + xyzFormat.format(cycle.widthFeature),
      "Z" + xyzFormat.format(z - cycle.depth),
      "Q" + xyzFormat.format(cycle.probeOvertravel),
      "R" + xyzFormat.format(cycle.probeClearance),
      getProbingArguments(cycle, false)
    );
    if (cycle.updateToolWear) {
      error(localize("Action -Update Tool Wear- is not supported with this cycle."));
      return;
    }
    break;
  }
}

function printProbeResults() {
  return currentSection.getParameter("printResults", 0) == 1;
}

/** Convert approach to sign. */
function approach(value) {
  validate((value == "positive") || (value == "negative"), "Invalid approach.");
  return (value == "positive") ? 1 : -1;
}
// <<<<< INCLUDED FROM include_files/probeCycles_renishaw.cpi
// >>>>> INCLUDED FROM include_files/getProbingArguments_renishaw.cpi
function getProbingArguments(cycle, updateWCS) {
  var outputWCSCode = updateWCS && currentSection.strategy == "probe";
  var probeOutputWorkOffset = currentSection.probeWorkOffset;
  if (outputWCSCode) {
    validate(probeOutputWorkOffset <= 99, "Work offset is out of range.");
    var nextWorkOffset = hasNextSection() ? getNextSection().workOffset == 0 ? 1 : getNextSection().workOffset : -1;
    if (probeOutputWorkOffset == nextWorkOffset) {
      currentWorkOffset = undefined;
    }
  }
  return [
    (cycle.angleAskewAction == "stop-message" ? "B" + xyzFormat.format(cycle.toleranceAngle ? cycle.toleranceAngle : 0) : undefined),
    ((cycle.updateToolWear && cycle.toolWearErrorCorrection < 100) ? "F" + xyzFormat.format(cycle.toolWearErrorCorrection ? cycle.toolWearErrorCorrection / 100 : 100) : undefined),
    (cycle.wrongSizeAction == "stop-message" ? "H" + xyzFormat.format(cycle.toleranceSize ? cycle.toleranceSize : 0) : undefined),
    (cycle.outOfPositionAction == "stop-message" ? "M" + xyzFormat.format(cycle.tolerancePosition ? cycle.tolerancePosition : 0) : undefined),
    ((cycle.updateToolWear && cycleType == "probing-z") ? "T" + xyzFormat.format(cycle.toolLengthOffset) : undefined),
    ((cycle.updateToolWear && cycleType !== "probing-z") ? "T" + xyzFormat.format(cycle.toolDiameterOffset) : undefined),
    (cycle.updateToolWear ? "V" + xyzFormat.format(cycle.toolWearUpdateThreshold ? cycle.toolWearUpdateThreshold : 0) : undefined),
    (cycle.printResults ? "W" + xyzFormat.format(1 + cycle.incrementComponent) : undefined), // 1 for advance feature, 2 for reset feature count and advance component number. first reported result in a program should use W2.
    conditional(outputWCSCode, "S" + probeWCSFormat.format(probeOutputWorkOffset > 6 ? (probeOutputWorkOffset - 6 + 100) : probeOutputWorkOffset))
  ];
}
// <<<<< INCLUDED FROM include_files/getProbingArguments_renishaw.cpi
// >>>>> INCLUDED FROM include_files/protectedProbeMove_renishaw.cpi
function protectedProbeMove(_cycle, x, y, z) {
  var _x = xOutput.format(x);
  var _y = yOutput.format(y);
  var _z = zOutput.format(z);
  if (_z && z >= getCurrentPosition().z) {
    writeBlock(gFormat.format(65), "P" + 9810, _z, getFeed(cycle.feedrate)); // protected positioning move
  }
  if (_x || _y) {
    writeBlock(gFormat.format(65), "P" + 9810, _x, _y, getFeed(highFeedrate)); // protected positioning move
  }
  if (_z && z < getCurrentPosition().z) {
    writeBlock(gFormat.format(65), "P" + 9810, _z, getFeed(cycle.feedrate)); // protected positioning move
  }
}
// <<<<< INCLUDED FROM include_files/protectedProbeMove_renishaw.cpi
// >>>>> INCLUDED FROM include_files/setProbeAngle_fanuc.cpi
function setProbeAngle() {
  if (probeVariables.outputRotationCodes) {
    var probeOutputWorkOffset = currentSection.probeWorkOffset;
    validate(probeOutputWorkOffset <= 6, "Angular Probing only supports work offsets 1-6.");
    if (settings.probing.probeAngleMethod == "G68" && (Vector.diff(currentSection.getGlobalInitialToolAxis(), new Vector(0, 0, 1)).length > 1e-4)) {
      error(localize("You cannot use multi axis toolpaths while G68 Rotation is in effect."));
    }
    var validateWorkOffset = false;
    switch (settings.probing.probeAngleMethod) {
    case "G54.4":
      var param = 26000 + (probeOutputWorkOffset * 10);
      writeBlock("#" + param + "=#135");
      writeBlock("#" + (param + 1) + "=#136");
      writeBlock("#" + (param + 5) + "=#144");
      writeBlock(gFormat.format(54.4), "P" + probeOutputWorkOffset);
      break;
    case "G68":
      gRotationModal.reset();
      gAbsIncModal.reset();
      var n = xyzFormat.format(0);
      writeBlock(
        gRotationModal.format(68), gAbsIncModal.format(90),
        probeVariables.compensationXY, "Z" + n, "I" + n, "J" + n, "K" + xyzFormat.format(1), "R[#144]"
      );
      validateWorkOffset = true;
      break;
    case "AXIS_ROT":
      var param = 5200 + probeOutputWorkOffset * 20 + 5;
      writeBlock("#" + param + " = " + "[#" + param + " + #144]");
      forceWorkPlane(); // force workplane to rotate ABC in order to apply rotation offsets
      currentWorkOffset = undefined; // force WCS output to make use of updated parameters
      validateWorkOffset = true;
      break;
    default:
      error(localize("Angular Probing is not supported for this machine configuration."));
      return;
    }
    if (validateWorkOffset) {
      for (var i = currentSection.getId(); i < getNumberOfSections(); ++i) {
        if (getSection(i).workOffset != currentSection.workOffset) {
          error(localize("WCS offset cannot change while using angle rotation compensation."));
          return;
        }
      }
    }
    probeVariables.outputRotationCodes = false;
  }
}
// <<<<< INCLUDED FROM include_files/setProbeAngle_fanuc.cpi
// >>>>> INCLUDED FROM include_files/setProbeAngleMethod.cpi
function setProbeAngleMethod() {
  settings.probing.probeAngleMethod = (machineConfiguration.getNumberOfAxes() < 5 || is3D()) ? (getProperty("useG54x4") ? "G54.4" : "G68") : "UNSUPPORTED";
  var axes = [machineConfiguration.getAxisU(), machineConfiguration.getAxisV(), machineConfiguration.getAxisW()];
  for (var i = 0; i < axes.length; ++i) {
    if (axes[i].isEnabled() && isSameDirection((axes[i].getAxis()).getAbsolute(), new Vector(0, 0, 1)) && axes[i].isTable()) {
      settings.probing.probeAngleMethod = "AXIS_ROT";
      break;
    }
  }
  probeVariables.outputRotationCodes = true;
}
// <<<<< INCLUDED FROM include_files/setProbeAngleMethod.cpi

// >>>>> INCLUDED FROM include_files/subprograms.cpi
var SUB_UNKNOWN = 0;
var SUB_PATTERN = 1;
var SUB_CYCLE = 2;
var subprograms = [];
var currentPattern = -1;
var firstPattern = false;
var currentSubprogram = 0;
var lastSubprogram = 0;
var definedPatterns = new Array();
var incrementalMode = false;
var saveShowSequenceNumbers;
var cycleSubprogramIsActive = false;
var patternIsActive = false;
var lastOperationComment = "";
var incrementalSubprogram;
validate(settings.subprograms, "Setting 'subprograms' is required but not defined.");

function subprogramStart(_initialPosition, _abc, _incremental) {
  if (getProperty("useFilesForSubprograms")) {
    var path = FileSystem.getCombinedPath(FileSystem.getFolderPath(getOutputPath()), currentSubprogram + "." + extension);
    redirectToFile(path);
    writeln(settings.subprograms.startBlock.files);
  } else {
    redirectToBuffer();
  }
  var comment = "";
  if (hasParameter("operation-comment")) {
    comment = getParameter("operation-comment");
  }

  writeln(
    settings.subprograms.startBlock.embedded + settings.subprograms.format.format(currentSubprogram) +
    conditional(comment, formatComment(comment.substr(0, settings.comments.maximumLineLength - 2 - 6 - 1)))
  );
  setProperty("showSequenceNumbers", "false");
  if (_incremental) {
    setIncrementalMode(_initialPosition, _abc);
  }
  gPlaneModal.reset();
  gMotionModal.reset();
}

function subprogramCall() {
  if (getProperty("useFilesForSubprograms")) {
    writeBlock(settings.subprograms.callBlock.files + settings.subprograms.format.format(currentSubprogram));
  } else {
    writeBlock(settings.subprograms.callBlock.embedded + settings.subprograms.format.format(currentSubprogram));
  }
}

function subprogramEnd() {
  if (isRedirecting()) {
    if (firstPattern) {
      var finalPosition = getFramePosition(currentSection.getFinalPosition());
      var abc;
      if (currentSection.isMultiAxis() && machineConfiguration.isMultiAxisConfiguration()) {
        abc = currentSection.getFinalToolAxisABC();
      } else {
        abc = getCurrentDirection();
      }
      setAbsoluteMode(finalPosition, abc);

      writeBlock(settings.subprograms.endBlock.embedded);
      if (getProperty("useFilesForSubprograms")) {
        writeln(settings.subprograms.startBlock.files);
      } else {
        writeln("");
        subprograms += getRedirectionBuffer();
      }
    }
    forceAny();
    firstPattern = false;
    cycleSubprogramIsActive = false;
    setProperty("showSequenceNumbers", saveShowSequenceNumbers);
    closeRedirection();
  }
}

/** Returns true if the spatial vectors are significantly different. */
function areSpatialVectorsDifferent(_vector1, _vector2) {
  return (xyzFormat.getResultingValue(_vector1.x) != xyzFormat.getResultingValue(_vector2.x)) ||
    (xyzFormat.getResultingValue(_vector1.y) != xyzFormat.getResultingValue(_vector2.y)) ||
    (xyzFormat.getResultingValue(_vector1.z) != xyzFormat.getResultingValue(_vector2.z));
}

/** Returns true if the spatial boxes are a pure translation. */
function areSpatialBoxesTranslated(_box1, _box2) {
  return !areSpatialVectorsDifferent(Vector.diff(_box1[1], _box1[0]), Vector.diff(_box2[1], _box2[0])) &&
    !areSpatialVectorsDifferent(Vector.diff(_box2[0], _box1[0]), Vector.diff(_box2[1], _box1[1]));
}

/** Returns true if the spatial boxes are same. */
function areSpatialBoxesSame(_box1, _box2) {
  return !areSpatialVectorsDifferent(_box1[0], _box2[0]) && !areSpatialVectorsDifferent(_box1[1], _box2[1]);
}

function subprogramDefine(_initialPosition, _abc, _retracted, _zIsOutput) {
  // convert patterns into subprograms
  var usePattern = false;
  patternIsActive = false;
  if (currentSection.isPatterned && currentSection.isPatterned() && (getProperty("useSubroutines") == "patterns")) {
    currentPattern = currentSection.getPatternId();
    firstPattern = true;
    for (var i = 0; i < definedPatterns.length; ++i) {
      if ((definedPatterns[i].patternType == SUB_PATTERN) && (currentPattern == definedPatterns[i].patternId)) {
        currentSubprogram = definedPatterns[i].subProgram;
        usePattern = definedPatterns[i].validPattern;
        firstPattern = false;
        break;
      }
    }

    if (firstPattern) {
      // determine if this is a valid pattern for creating a subprogram
      usePattern = subprogramIsValid(currentSection, currentPattern, SUB_PATTERN);
      if (usePattern) {
        currentSubprogram = ++lastSubprogram;
      }
      definedPatterns.push({
        patternType    : SUB_PATTERN,
        patternId      : currentPattern,
        subProgram     : currentSubprogram,
        validPattern   : usePattern,
        initialPosition: _initialPosition,
        finalPosition  : _initialPosition
      });
    }

    if (usePattern) {
      // make sure Z-position is output prior to subprogram call
      if (!_retracted && !_zIsOutput) {
        writeBlock(gMotionModal.format(0), zOutput.format(_initialPosition.z));
      }

      // call subprogram
      subprogramCall();
      patternIsActive = true;

      if (firstPattern) {
        subprogramStart(_initialPosition, _abc, incrementalSubprogram);
      } else {
        skipRemainingSection();
        setCurrentPosition(getFramePosition(currentSection.getFinalPosition()));
      }
    }
  }

  // Output cycle operation as subprogram
  if (!usePattern && (getProperty("useSubroutines") == "cycles") && currentSection.doesStrictCycle &&
      (currentSection.getNumberOfCycles() == 1) && currentSection.getNumberOfCyclePoints() >= settings.subprograms.minimumCyclePoints) {
    var finalPosition = getFramePosition(currentSection.getFinalPosition());
    currentPattern = currentSection.getNumberOfCyclePoints();
    firstPattern = true;
    for (var i = 0; i < definedPatterns.length; ++i) {
      if ((definedPatterns[i].patternType == SUB_CYCLE) && (currentPattern == definedPatterns[i].patternId) &&
          !areSpatialVectorsDifferent(_initialPosition, definedPatterns[i].initialPosition) &&
          !areSpatialVectorsDifferent(finalPosition, definedPatterns[i].finalPosition)) {
        currentSubprogram = definedPatterns[i].subProgram;
        usePattern = definedPatterns[i].validPattern;
        firstPattern = false;
        break;
      }
    }

    if (firstPattern) {
      // determine if this is a valid pattern for creating a subprogram
      usePattern = subprogramIsValid(currentSection, currentPattern, SUB_CYCLE);
      if (usePattern) {
        currentSubprogram = ++lastSubprogram;
      }
      definedPatterns.push({
        patternType    : SUB_CYCLE,
        patternId      : currentPattern,
        subProgram     : currentSubprogram,
        validPattern   : usePattern,
        initialPosition: _initialPosition,
        finalPosition  : finalPosition
      });
    }
    cycleSubprogramIsActive = usePattern;
  }

  // Output each operation as a subprogram
  if (!usePattern && (getProperty("useSubroutines") == "allOperations")) {
    currentSubprogram = ++lastSubprogram;
    subprogramCall();
    firstPattern = true;
    subprogramStart(_initialPosition, _abc, false);
  }
}

function subprogramIsValid(_section, _patternId, _patternType) {
  var sectionId = _section.getId();
  var numberOfSections = getNumberOfSections();
  var validSubprogram = _patternType != SUB_CYCLE;

  var masterPosition = new Array();
  masterPosition[0] = getFramePosition(_section.getInitialPosition());
  masterPosition[1] = getFramePosition(_section.getFinalPosition());
  var tempBox = _section.getBoundingBox();
  var masterBox = new Array();
  masterBox[0] = getFramePosition(tempBox[0]);
  masterBox[1] = getFramePosition(tempBox[1]);

  var rotation = getRotation();
  var translation = getTranslation();
  incrementalSubprogram = undefined;

  for (var i = 0; i < numberOfSections; ++i) {
    var section = getSection(i);
    if (section.getId() != sectionId) {
      defineWorkPlane(section, false);

      // check for valid pattern
      if (_patternType == SUB_PATTERN) {
        if (section.getPatternId() == _patternId) {
          var patternPosition = new Array();
          patternPosition[0] = getFramePosition(section.getInitialPosition());
          patternPosition[1] = getFramePosition(section.getFinalPosition());
          tempBox = section.getBoundingBox();
          var patternBox = new Array();
          patternBox[0] = getFramePosition(tempBox[0]);
          patternBox[1] = getFramePosition(tempBox[1]);

          if (areSpatialBoxesSame(masterPosition, patternPosition) && areSpatialBoxesSame(masterBox, patternBox) && !section.isMultiAxis()) {
            incrementalSubprogram = incrementalSubprogram ? incrementalSubprogram : false;
          } else if (!areSpatialBoxesTranslated(masterPosition, patternPosition) || !areSpatialBoxesTranslated(masterBox, patternBox)) {
            validSubprogram = false;
            break;
          } else {
            incrementalSubprogram = true;
          }
        }

      // check for valid cycle operation
      } else if (_patternType == SUB_CYCLE) {
        if ((section.getNumberOfCyclePoints() == _patternId) && (section.getNumberOfCycles() == 1)) {
          var patternInitial = getFramePosition(section.getInitialPosition());
          var patternFinal = getFramePosition(section.getFinalPosition());
          if (!areSpatialVectorsDifferent(patternInitial, masterPosition[0]) && !areSpatialVectorsDifferent(patternFinal, masterPosition[1])) {
            validSubprogram = true;
            break;
          }
        }
      }
    }
  }
  setRotation(rotation);
  setTranslation(translation);
  return (validSubprogram);
}

function setAxisMode(_format, _output, _prefix, _value, _incr) {
  var i = _output.isEnabled();
  if (_output == zOutput) {
    _output = _incr ? createIncrementalVariable({onchange:function() {retracted = false;}, prefix:_prefix}, _format) : createVariable({onchange:function() {retracted = false;}, prefix:_prefix}, _format);
  } else {
    _output = _incr ? createIncrementalVariable({prefix:_prefix}, _format) : createVariable({prefix:_prefix}, _format);
  }
  _output.format(_value);
  _output.format(_value);
  i = i ? _output.enable() : _output.disable();
  return _output;
}

function setIncrementalMode(xyz, abc) {
  xOutput = setAxisMode(xyzFormat, xOutput, "X", xyz.x, true);
  yOutput = setAxisMode(xyzFormat, yOutput, "Y", xyz.y, true);
  zOutput = setAxisMode(xyzFormat, zOutput, "Z", xyz.z, true);
  aOutput = setAxisMode(abcFormat, aOutput, "A", abc.x, true);
  bOutput = setAxisMode(abcFormat, bOutput, "B", abc.y, true);
  cOutput = setAxisMode(abcFormat, cOutput, "C", abc.z, true);
  gAbsIncModal.reset();
  writeBlock(gAbsIncModal.format(91));
  incrementalMode = true;
}

function setAbsoluteMode(xyz, abc) {
  if (incrementalMode) {
    xOutput = setAxisMode(xyzFormat, xOutput, "X", xyz.x, false);
    yOutput = setAxisMode(xyzFormat, yOutput, "Y", xyz.y, false);
    zOutput = setAxisMode(xyzFormat, zOutput, "Z", xyz.z, false);
    aOutput = setAxisMode(abcFormat, aOutput, "A", abc.x, false);
    bOutput = setAxisMode(abcFormat, bOutput, "B", abc.y, false);
    cOutput = setAxisMode(abcFormat, cOutput, "C", abc.z, false);
    gAbsIncModal.reset();
    writeBlock(gAbsIncModal.format(90));
    incrementalMode = false;
  }
}
// <<<<< INCLUDED FROM include_files/subprograms.cpi
