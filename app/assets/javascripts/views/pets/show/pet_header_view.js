FosterPet.Views.PetHeaderView = Backbone.View.extend({
  initialize: function(options) {
    this.pet_gallery_collection = new FosterPet.Collections.PetGalleryPhotos(this.id);
  },

  template: JST['pets/header'],

  render: function() {
    var that = this;
    this.pet_gallery_collection.fetch({
      success: function() {
        var total_photos = that.pet_gallery_collection.length;
        var renderedContent = that.template({
          pet: that.model,
          total_photos: total_photos
        });
        that.$el.html(renderedContent);
      }
    });
    return this;
  }

});