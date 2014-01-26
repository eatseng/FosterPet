FosterPet.Views.PetIndexView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, "add remove", this.render);
  },

  events: {
    "click button.edit_pet" : "edit",
    "click button.delete_pet" : "delete",
    "click button.btn-delete" : "destroy"
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

    this.petForm = new FosterPet.Views.PetsFormView({
      $el: this.$('.modal-body'),
      model: this.collection.get($(event.target).attr("pet_id"))
    });
    this.$('.modal-body').html(this.petForm.render().$el);

    $('#edit_pet').modal();
  },

  delete: function(event) {
    event.preventDefault();
    $('button.btn-delete').attr('pet_id', $(event.target).attr('pet_id'))
    $('#delete_pet').modal();
  },

  destroy: function(event){
    var pet = this.collection.get($(event.target).attr('pet_id'));
    //pet.destroy();
    setTimeout(function() { pet.destroy(); }, 1000);
  }
});