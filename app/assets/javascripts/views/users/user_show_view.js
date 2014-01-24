FosterPet.Views.UserShowView = Backbone.View.extend({
  initialize: function() {
    this.user_gallery_collection = new FosterPet.Collections.UserGalleryPhotos(this.id);
  },

  templateStructure: JST['users/show'],
  templateHeader: JST['users/header'],


  render: function() {
    var that = this;
    this.user_gallery_collection.fetch({
      success: function() {
        var total_photos = that.user_gallery_collection.length;

        that.$el.html(that.templateStructure());
            
        that.$('.top_header').html(that.templateHeader({
          user: that.model,
          total_photos: total_photos
        }));
      
        that.userWall = new FosterPet.Views.UserWallView({
          $el: that.$('.user_wall'),
          user: that.model,
          id: that.id
        });

        that.$('.user_wall').html(that.userWall.render().$el);
      }  
    });
    return this;
  }



});