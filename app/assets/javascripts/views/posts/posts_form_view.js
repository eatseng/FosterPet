FosterPet.Views.PostsFormView = Backbone.View.extend({
  events: {
    "click .btn-submit-post": "submit",
    "click .btn-add-photo": "addPhoto"
  },

  initialize: function(options) {
    this.pet_collection = options.pet_collection;
    this.user_collection = options.user_collection;
    this.post_collection = options.post_collection;
  },

  template: JST['posts/form'],
  photoTemplate: JST['photo/form'],

  render: function() {
    var that = this;
    this.pet_collection.fetch({
      remove: false,
      data: {page: that.pet_collection.total_pages},
      success: function(){
        var renderedContent = that.template({
          pets: that.pet_collection,
          users: that.user_collection
        });
        that.$el.html(renderedContent);
      }
    });
    return this;
  },

  submit: function() {
    event.preventDefault();
    var attrs = $('form').serializeJSON();

    this.model.set(attrs);
    if (this.model.isNew()) {
      this.post_collection.create(this.model, {
        success: function(){
          Backbone.history.navigate("", {trigger:true});
        }
      });
    } else {
      this.model.save({}, {
        success: function(){
          Backbone.history.navigate("", {trigger:true});
        }
      });
    }
  },

  addPhoto: function(event) {
    event.preventDefault();
    $('.photo_form_container').append(this.photoTemplate());
    $(event.target).html("Add Another Photo");
  }
});