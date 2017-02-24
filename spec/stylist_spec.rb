require("rspec")
  require("pg")
  require("stylist")

  describe(Stylist) do
    describe(".all") do
      it("is empty at first") do
        expect(Stylist.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("adds a stylist to the array of saved stylists") do
        test_stylist = Stylist.new({:name => "learn SQL", :client_id => 1})
        test_stylist.save()
        expect(Stylist.all()).to(eq([test_stylist]))
      end
    end

    describe("#name") do
      it("lets you read the name out") do
        test_stylist = Stylist.new({:description => "learn SQL", :client_id => 1})
        expect(test_stylist.name()).to(eq("learn SQL"))
      end
    end

    describe("#client_id") do
      it("lets you read the client ID out") do
        test_stylist = Stylist.new({:name => "learn SQL", :client_id => 1})
        expect(test_stylist.client_id()).to(eq(1))
      end
    end

    describe("#==") do
      it("is the same stylist if it has the same name and client ID") do
        stylist1 = Stylist.new({:name => "learn SQL", :client_id => 1})
        stylist2 = Stylist.new({:name => "learn SQL", :client_id => 1})
        expect(stylist1).to(eq(stylist2))
      end
    end
  end
