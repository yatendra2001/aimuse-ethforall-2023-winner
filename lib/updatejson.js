var fs = require('fs')
const IMAGES_CID = 'QmQbUrjBJjfMzLhv9xyfyHZXXjWejreiE21NAJP4c7TfQe';
console.log('Images CID', IMAGES_CID);

var fileName = 'assets/json/test_image.json';
console.log('Updating file', fileName);
const data = fs.readFileSync(fileName, { encoding: 'utf8', flag: 'r' });
// console.log('before', data);
var result = data.replace("IMAGES_CID", IMAGES_CID);
// console.log('after', result);
fs.writeFileSync(fileName, result);
