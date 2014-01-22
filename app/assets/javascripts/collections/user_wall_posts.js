FosterPet.Collections.UserWallPosts = Backbone.Collection.extend({
  initialize: function(id) {
    this.id = id;
  },

  model: FosterPet.Models.Post,
  url: function() {
      return "users/" + this.id + "/userwall/";
  }
});