FosterPet.Collections.Posts = Backbone.Collection.extend({
  model: FosterPet.Models.Post,
  url: '/posts',
  comparator: function(val1, val2) {
    if (val1.get('created_at') > val2.get('created_at')) {
      return -1;
    } else if (val1.get('created_at') < val2.get('created_at')) {
      return 1;
    } else {
      return 0;
    }
  }
});