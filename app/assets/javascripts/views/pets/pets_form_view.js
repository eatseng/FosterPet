FosterPet.Views.PetsFormView = Backbone.View.extend({
  events: {
    "click .btn": "submit"
  },

  template: JST['pets/form'],

  render: function() {
    var renderedContent = this.template({
      pet: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  submit: function(event) {
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
  },

  _close:function() {
  }
});