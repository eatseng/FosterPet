FosterPet.Views.PetOwnerView = Backbone.View.extend({
  template: JST['pets/ownership'],

  render: function() {
    var renderedContent = this.template({
      pet: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});