FosterPet.Collections.PetWallPosts = Backbone.Collection.extend({
  initialize: function(id) {
    this.id = id;
  },

  model: FosterPet.Models.Post,
  url: function() {
      return "pets/" + this.id + "/petwall/";
  }
});