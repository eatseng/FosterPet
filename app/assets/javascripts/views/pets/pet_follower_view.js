FosterPet.Views.PetFollowerView = Backbone.View.extend({
  template: JST['pets/followers'],

  render: function() {
    var renderedContent = this.template({
      pet: this.model
    });

    this.$el.html(renderedContent);
    return this;
  }

});