FosterPet.Views.TestimonialsFormView = Backbone.View.extend({
  events: {
    "click .btn": "submit"
  },

  initialize: function(options) {
    this.pet_id = options.pet_id
  },

  template: JST['testimonials/form'],

  render: function() {
    var renderedContent = this.template({
      pet_id: this.pet_id
    });

    this.$el.html(renderedContent);
    return this;
  },

  submit: function() {
    event.preventDefault();
    var attrs = $('form').serializeJSON();

    this.model.set(attrs);
    if (this.model.isNew()) {
      this.collection.create(this.model, {
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