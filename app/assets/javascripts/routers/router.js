FosterPet.Routers.Router = Backbone.Router.extend({
  routes: {
    "" : "home",
    "pets/new" : "new",
    "pets/:id" : "show",
    "pets/:id/edit" : "edit",
    "posts/new" : "newPost",
    "feeds/" : "feeds"
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.pet_collection = options.pets;
    this.user_collection = options.users;
    this.post_collection = options.posts;
  },

  home: function() {
    var renderedContent = new FosterPet.Views.PetsHomeView({
      collection: this.pet_collection
    });
    this._swapView(renderedContent);
  },

  new: function() {
    var newPet = new FosterPet.Models.Pet();

    var renderedContent = new FosterPet.Views.PetsFormView({
      collection: this.pet_collection,
      model: newPet
    });
    this._swapView(renderedContent);
  },

  edit: function(id) {
    var renderedContent = new FosterPet.Views.PetsFormView({
      model: this.pet_collection.get(id)
    });
    this._swapView(renderedContent);
  },

  show: function(id) {
    var renderedContent = new FosterPet.Views.PetsShowView({
      collection: this.pet_collection,
      model: this.pet_collection.get(id)
    });
    this._swapView(renderedContent);
  },

  newPost: function() {
    var that = this;

    $.when(this.user_collection.fetch(), this.post_collection.fetch()).then(function() {
        var renderedContent = new FosterPet.Views.PostsFormView({
          pet_collection: that.pet_collection,
          user_collection: that.user_collection,
          post_collection: that.post_collection,
          model: new FosterPet.Models.Post()
        });
        that._swapView(renderedContent);
      });
  },

  feeds: function() {
    debugger
    var that = this;

    this.post_collection.fetch({
      success: function() {
        var renderedContent = new FosterPet.Views.Feeds({
          collection: that.post_collection
        });
        that._swapView(renderedContent);
      }
    });
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});