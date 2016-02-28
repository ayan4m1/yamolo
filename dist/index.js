var fs, mongoose, path;

fs = require('fs');

path = require('path');

mongoose = require('mongoose');

module.exports = function(basePath) {
  var file, fileParts, fullPath, i, len, modules, ref;
  modules = [];
  ref = fs.readdirSync(basePath);
  for (i = 0, len = ref.length; i < len; i++) {
    file = ref[i];
    fileParts = file.match(/(.*)\.(coffee|js)$/);
    if (fileParts == null) {
      return;
    }
    fullPath = path.join(basePath, fileParts[1]);
    modules.push(mongoose.model(fileParts[1], require(fullPath)));
  }
  return modules;
};
