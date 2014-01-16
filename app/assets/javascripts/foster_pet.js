window.FosterPet = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var pets = new FosterPet.Collections.Pets();
    var $rootEl = $('.content');

    pets.fetch({
      success: function() {
        new FosterPet.Routers.Router($rootEl, pets);
        Backbone.history.start();
      }
    });
  }
};

$(document).ready(function(){
  FosterPet.initialize();
});
