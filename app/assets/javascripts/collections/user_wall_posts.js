FosterPet.Collections.UserWallPosts = Backbone.Collection.extend({
  initialize: function(id) {
    this.id = id;
  },

  model: FosterPet.Models.Post,
  url: function() {
      return "users/" + this.id + "/userwall/";
  },
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