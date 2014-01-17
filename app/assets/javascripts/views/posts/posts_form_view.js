FosterPet.Views.PostsFormView = Backbone.View.extend({
  events: {
    "click .btn": "submit"
  },

  initialize: function(options) {
    this.pet_collection = options.pet_collection;
    this.user_collection = options.user_collection;
    this.post_collection = options.post_collection;
  },

  template: JST['posts/form'],

  render: function() {
    var renderedContent = this.template({
      pets: this.pet_collection,
      users: this.user_collection
    });

    this.$el.html(renderedContent);
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
  }
});