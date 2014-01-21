FosterPet.Models.Pet = Backbone.Model.extend({
  urlRoot: '/pets',

  parse: function (data) {
    if (data.following) {
      data.following = new FosterPet.Models.Following(data.following);
    }
    if (data.followers) {
      data.followers = new FosterPet.Collections.Users(data.followers);
    }
    return data;
  },

  toJson: function() {
    var data = _.clone(this.attributes);
    data.unset('following');
    data.unset('followers');
    return data;
  }
});