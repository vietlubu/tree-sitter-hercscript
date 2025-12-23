try {
  module.exports = require("../../build/Release/tree_sitter_hercscript_binding");
} catch (error1) {
  if (error1.code !== 'MODULE_NOT_FOUND') {
    throw error1;
  }
  try {
    module.exports = require("../../build/Debug/tree_sitter_hercscript_binding");
  } catch (error2) {
    if (error2.code !== 'MODULE_NOT_FOUND') {
      throw error2;
    }
    throw new Error(
      'Could not find tree_sitter_hercscript_binding.node. ' +
      'Try running `npm run build` to compile the grammar.'
    );
  }
}

try {
  module.exports.nodeTypeInfo = require("../../src/node-types.json");
} catch (_) {}