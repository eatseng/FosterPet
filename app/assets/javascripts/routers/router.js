FosterPet.Routers.Router = Backbone.Router.extend({
  routes: {
    "" : "home",
    "pets/new" : "new",
    "pets/:id" : "show",
    "pets/:id/edit" : "edit",
    "posts/new" : "newPost",
    "pets/:pet_id/testimonials/new" : "newTestimonial",
    "feeds" : "feeds"
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.$rootNav = options.$rootNav;
    this.pet_collection = options.pets;
    this.user_collection = options.users;
    this.post_collection = options.posts;
    this.feed_collection = options.feeds;
    this.testimonial_collection = options.testimonials;
  },

  home: function() {
    var renderedContent = new FosterPet.Views.PetsHomeView({
      collection: this.pet_collection
    });
    this._swapView(renderedContent);
  },

  new: function() {
    var renderedContent = new FosterPet.Views.PetsFormView({
      collection: this.pet_collection,
      model: new FosterPet.Models.Pet()
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
      post_collection: this.post_collection,
      model: this.pet_collection.get(id),
      id: id
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

  newTestimonial: function(pet_id) {
    var that = this;
    this.testimonial_collection = new FosterPet.Collections.Testimonials(pet_id);
    this.testimonial_collection.fetch({
      success: function() {
        var renderedContent = new FosterPet.Views.TestimonialsFormView({
          collection: that.testimonial_collection,
          model: new FosterPet.Models.Testimonial(),
          pet_id: pet_id
        });
        that._swapView(renderedContent);
      }
    });
  },

  feeds: function() {
    var that = this;

    this.feed_collection.fetch({
      success: function() {
        var renderedContent = new FosterPet.Views.Feeds({
          collection: that.feed_collection
        });

        that._swapView(renderedContent);
      }
    });
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

  // _templateNav: JST['nav_bar/navbar'],

  // _swapNav: function() {
  //   $('nav').remove();
  //   this.$rootNav.html(this._templateNav());
  // }
});