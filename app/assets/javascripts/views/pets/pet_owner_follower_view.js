FosterPet.Views.PetOwnerFollowerView = Backbone.View.extend({
  initialize: function(options) {
    this.template = options.template;
  },

  events: {
    "click button.back" : "back",
  },

  render: function() {
    var renderedContent = this.template({
      pet: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },
  
  back: function() {
    window.history.back();
  }

});