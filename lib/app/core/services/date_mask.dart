dateMask(String date) {
  var splitOne = date.split(' ');
  var splitTwo = splitOne[0].split('-');
  var result = splitTwo.reversed.join('/');
  return result;
}