describe("creating the date", function(){
  it("should display the correct date", function(){
    expect("2014-05-22T07:30:00".generateDate()).toEqual("May 2, 2014");
  });
});

describe("creating the time", fucntion(){
  it("should display the correct time", function(){
    expect("2014-05-22T07:30:00".generateTime()).toEqual("07:30 AM ");
  });
});
