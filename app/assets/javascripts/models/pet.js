FosterPet.Models.Pet = Backbone.Model.extend({
  urlRoot: '/pets',

  parse: function (data) {
    if (data.following) {
      data.following = new FosterPet.Models.Following(data.following);
    }
    return data;
  },

  toJson: function() {
    var data = _.clone(this.attributes);
    data.unset('following');
    return data;
  }
});