FosterPet.Collections.PetGalleryPhotos = Backbone.Collection.extend({
  initialize: function(id) {
    this.id = id;
  },
  model: FosterPet.Models.Photo,
  url: function() {
      return "pets/" + this.id + "/gallery";
  }
});