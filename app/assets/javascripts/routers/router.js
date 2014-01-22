FosterPet.Routers.Router = Backbone.Router.extend({
  routes: {
    "" : "home",
    "users/new" : "newUser",
    "users/:id" : "showUser",
    "pets/:id" : "show",
    "pets/:id/edit" : "edit",
    "posts/new" : "newPost",
    "pets/:pet_id/testimonials/new" : "newTestimonial",
    "feeds" : "feeds",
    "pets/:id/followers" : "followers",
    "users/:id/following_pets" : "followingPets",
    "pets/:id/owners" : "petOwners",
    "users/:id/owned_pets" : "ownedPets",
    "admin/pets" : "petsIndex",
    "admin/pets/new" : "newPet",
    "postApprove" : "postApprove"
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.$rootNav = options.$rootNav;
    this.pet_collection = options.pets;
    this.user_collection = options.users;
    this.post_collection = options.posts;
    this.feed_collection = options.feeds;
    this.approve_collection = options.approve;
    this.public_collection = options.publicposts;
  },

  newUser: function() {


  },

  showUser: function(id) {
    var that = this;
    this.user_collection.fetch({
      success: function() {
        var renderedContent = new FosterPet.Views.UserShowView({
          model: that.user_collection.get(id),
          id: id
        });
        that._swapView(renderedContent);
      }
    });
  },


  home: function() {
    var renderedContent = new FosterPet.Views.PetsHomeView({
      collection: this.pet_collection
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
    var that = this;
    this.pet_collection.fetch({
      success: function() {
        var renderedContent = new FosterPet.Views.PetsShowView({
          collection: that.pet_collection,
          post_collection: that.post_collection,
          model: that.pet_collection.get(id),
          id: id
        });
        that._swapView(renderedContent);
      }
    });
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

  followers: function(id) {
    var renderedContent = new FosterPet.Views.PetFollowerView({
      model: this.pet_collection.get(id)
    });
    this._swapView(renderedContent);
  },

  followingPets: function(id) {
    var that = this;
    this.user_collection.fetch({
      success: function() {
        var renderedContent = new FosterPet.Views.UserFollowingView({
          model: that.user_collection.get(id)
        });
        that._swapView(renderedContent);
      }
    });
  },

  petOwners: function(id) {
    var that = this;
    this.pet_collection.fetch({
      success: function() {
        var renderedContent = new FosterPet.Views.PetOwnerView({
          model: that.pet_collection.get(id)
        });
        that._swapView(renderedContent);
      }
    });
  },

  ownedPets: function(id) {
    var that = this;
    this.user_collection.fetch({
      success: function() {
        var renderedContent = new FosterPet.Views.UserOwnerView({
          model: that.user_collection.get(id)
        });
        that._swapView(renderedContent);
      }
    });
  },

  petsIndex: function() {
    var renderedContent = new FosterPet.Views.PetIndexView({
      collection: this.pet_collection
    });
    this._swapView(renderedContent);
  },

  newPet: function() {
    var renderedContent = new FosterPet.Views.PetsFormView({
      collection: this.pet_collection,
      model: new FosterPet.Models.Pet()
    });
    this._swapView(renderedContent);
  },

  postApprove: function() {
    var renderedContent = new FosterPet.Views.PostsApproveView({
      public_collection: this.public_collection,
      approve_collection: this.approve_collection,
    });
    this._swapView(renderedContent);
    // var that = this;
  //   this.post_collection.fetch({
  //     var renderedContent = new FosterPet.Views.PostsApproveView({
  //       collection: that.post_collection
  //     });
  //     that._swapView(renderedContent);
  //   });
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

  // _templateNav: JST['nav_bar/navbar'],

  // _swapNav: function() {
  //   $('nav').remove();
  //   this.$rootNav.html(this._templateNav());
  // }
});