FosterPet.Collections.UserGalleryPhotos = Backbone.Collection.extend({
  initialize: function(id) {
    this.id = id;
  },
  model: FosterPet.Models.Photo,
  url: function() {
      return "users/" + this.id + "/gallery";
  }
});