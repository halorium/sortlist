angular.module('app').filter('tagsFilter', function () {
  return function (items, tags) {
    var filtered = [];
    var matches = false;
    if (tags) {
      tags = tags || '';
      tags = tags.match(/[^ ,]+/g);

      (items || []).forEach(function (item) {
        var matches = tags.every(function (tag) {
          var mapping = item.tag_list.map(function(tag_name){
            return (tag_name.toLowerCase().indexOf(tag.toLowerCase()) > -1);
          });
          if ($.inArray(true, mapping) > -1) {
            return true;
          }
        });
        if (matches) {
          filtered.push(item);
        }
      });
      return filtered;
    } else {
      return items;
    }
  };
});
