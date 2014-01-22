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
    //var testimonials = new FosterPet.Collections.Testimonials();
    var approve = new FosterPet.Collections.ApprovePosts();
    var publicposts = new FosterPet.Collections.PublicShares();
    var $rootEl = $('.content');

    pets.fetch({
      success: function() {
        new FosterPet.Routers.Router({
          $rootEl: $rootEl,
          pets: pets,
          users: users,
          posts: posts,
          feeds: feeds,
          approve: approve,
          publicposts: publicposts
          //testimonials: testimonials
        });
        Backbone.history.start();
      }
    });
  }
};

$(document).ready(function(){
  FosterPet.initialize();
});
