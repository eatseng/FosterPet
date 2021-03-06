window.FosterPet = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var pets = new FosterPet.Collections.Pets();
    var users = new FosterPet.Collections.Users();
    var posts = new FosterPet.Collections.Posts();
    var feeds = new FosterPet.Collections.Feeds();
    var approve = new FosterPet.Collections.ApprovePosts();
    var publicPosts = new FosterPet.Collections.PublicShares();
    var userGallery = new FosterPet.Collections.UserGalleryPhotos();
    var $rootEl = $('.row-fluid');

    pets.fetch({
      remove: false,
      data: { page: 0 },
      success: function() {
        new FosterPet.Routers.Router({
          $rootEl: $rootEl,
          pets: pets,
          users: users,
          posts: posts,
          feeds: feeds,
          approve: approve,
          publicPosts: publicPosts,
          userGallery: userGallery
        });
        Backbone.history.start();
      }
    });
  }
};

$(document).ready(function(){
  FosterPet.initialize();
});
