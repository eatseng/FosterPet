FosterPet.Views.PetsShowView = Backbone.View.extend({
  events: {
    "click button.delete" : "delete"
  },

  template: JST['pets/show'],

  render: function() {
    var renderedContent = this.template({
      pet: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  delete: function(event) {
    var pet = this.collection.get($(event.target).attr('pet_id'));
    pet.destroy({
      success: function() {
        Backbone.history.navigate("", {trigger:true});
      }
    });
  }
});