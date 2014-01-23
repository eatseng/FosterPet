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

  //formStructure: JST['posts/form_structure'],
  template: JST['posts/form'],
  photoTemplate: JST['photo/form'],

  render: function() {
    //this.$el.html(this.formStructure());

    var renderedContent = this.template({
      pets: this.pet_collection,
      users: this.user_collection
    });

    this.$el.html(renderedContent);
    //this.$('.form').html(renderedContent);
    //this.$('.photo').html(this.photoTemplate());

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
    $('.photo_container').append(this.photoTemplate());
    $(event.target).html("Add Another Photo");
  }
});