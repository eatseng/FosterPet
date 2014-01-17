FosterPet.Views.PetsHomeView = Backbone.View.extend({
  events: {
    "click button.follow" : "follow"
  },

  template: JST['pets/home'],

  render: function() {
    var renderedContent = this.template({
      pets: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  },

  follow: function(event){
    var following = new FosterPet.Models.Following();
    following.set({pet_id: $(event.target).attr('pet_id')});
    following.save();
  }

});