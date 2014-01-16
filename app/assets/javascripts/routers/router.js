FosterPet.Routers.Router = Backbone.Router.extend({
  routes: {
    "" : "home",
    "/pets/new" : "new",
    "/pets/:id" : "show"
  },

  initialize: function($rootEl, pets){
    this.$rootEl = $rootEl;
    this.collection = pets;
  },

  home: function(){
    var renderedContent = new FosterPet.Views.HomeView({
      collection: this.collection
    });
    this._swapView(renderedContent);
  },

  new: function(){
    var newPet = new FosterPet.Models.Pet();

    var renderedContent = new FosterPet.Views.FormView({
      collection: this.collection,
      model: newPet
    });

    this._swapView(renderedContent);
  },

  show: function(id){
    var renderedContent = new FosterPet.Views.HomeView({
      collection: this.collection.get(id)
    });
    this._swapView(renderedContent);
  },

  _swapView: function(view){
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});