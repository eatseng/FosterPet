FosterPet.Views.PetIndexView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, "add remove", this.render);
  },

  events: {
    "click button.edit_pet" : "edit",
    "click button.delete_pet" : "destroy"
  },

  template: JST['admin/pet_index'],

  render: function() {
    var renderedContent = this.template({
      pets: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  },

  edit: function(event) {
    event.preventDefault();
    $('#edit_pet').modal();
  },

  destroy: function(event){
    event.preventDefault();
    var pet = this.collection.get($(event.target).attr('pet_id'));
    pet.destroy();
  }
});