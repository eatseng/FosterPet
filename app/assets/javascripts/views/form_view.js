FosterPet.Views.FormView = Backbone.View.extend({
  template: JST['pets/form'],

  render: function() {
    var renderedContent = this.template({
      pet: this.model
    });

    this.$el.html(renderedContent);
    return this;
  }



});