FosterPet.Views.PetHeaderView = Backbone.View.extend({
  template: JST['pets/header'],

  render: function() {
    var renderedContent = this.template({
      pet: this.model
    });

    this.$el.html(renderedContent);
    return this;
  }

});