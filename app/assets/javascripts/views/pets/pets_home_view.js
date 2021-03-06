FosterPet.Views.PetsHomeView = Backbone.View.extend({
  events: {
    "click button.btn-follow" : "follow",
    "click button.btn-unfollow" : "unfollow",
  },

  initialize: function() {
    $(window).on("scroll", this.listenToScroll.bind(this));
    this.listenTo(this.collection, "add remove", this.render);
  },

  template: JST['pets/home'],

  render: function() {
    var renderedContent = this.template({
      pets: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  },

  follow: function(event) {
    var that = this;
    var following = this._setupObject(event);
    following.save({}, {
      success:function(object) {
        $(event.target).parents('.following').children('.btn-unfollow').attr('id', object.id)
        that._toggleStatus(event);
        that.collection.get($(event.target).attr('pet_id')).set('following', following);
      }
    });
  },

  unfollow: function(event) {
    var following = this._setupObject(event);
    following.destroy();
    this.collection.get($(event.target).attr('pet_id')).unset('following');
    this._toggleStatus(event);
  },

  listenToScroll: function() {
    if (this.isAtBottom()) {
      if (!this.throttledCallback) {
        this.throttledCallback = _.throttle(this.nextPage.bind(this), 300);
      }
      this.throttledCallback();
    }
  },

  isAtBottom: function () {
    var currentPos = $(document).scrollTop();
    var windowHeight = $(window).height();
    var totalHeight = $(document).height();
    var buffer = 100;
    return ((currentPos + buffer) > (totalHeight - windowHeight))
  },

  nextPage: function() {
    var that = this;
    console.log(that.collection.page)
    if (that.collection.page < that.collection.total_pages) {
      that.collection.fetch({
        data: {page: that.collection.page + 1},
        remove: false
      });
    }

    // model.save({}, {
//       error: function (model, response) {
//
//       }
//     })
  },

  _close:function() {
    $(window).unbind("scroll", FosterPet.Views.PetsHomeView.listenToScroll);
  },

  _toggleStatus: function(event) {
    $(event.target).parents('.following').toggleClass('can_follow')
    $(event.target).parents('.following').toggleClass('can_unfollow')
  },

  _setupObject: function(event) {
    var following = new FosterPet.Models.Following();
    following.set({id: $(event.currentTarget).attr('id')});
    following.set({pet_id: $(event.target).attr('pet_id')});
    return following;
  }
});