require('rspec')
  require('pg')
  require('client')

  DB = PG.connect({:dbname => 'hair_salon_test'})

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM clients *;")
    end
  end

  describe(Client) do
    describe(".all") do
      it("starts off with no clients") do
        expect(Client.all()).to(eq([]))
      end
    end

    describe("#name") do
      it("tells you its name") do
        client = Client.new({:name => "Epicodus stuff", :id => nil})
        expect(client.name()).to(eq("Epicodus stuff"))
      end
    end

    describe("#id") do
      it("sets its ID when you save it") do
        client = Client.new({:name => "Epicodus stuff", :id => nil})
        client.save()
        expect(client.id()).to(be_an_instance_of(Fixnum))
      end
    end

    describe("#save") do
      it("lets you save clients to the database") do
        client = Client.new({:name => "Epicodus stuff", :id => nil})
        client.save()
        expect(Client.all()).to(eq([client]))
      end
    end

    describe("#==") do
      it("is the same client if it has the same name") do
        client1 = Client.new({:name => "Epicodus stuff", :id => nil})
        client12 = Client.new({:name => "Epicodus stuff", :id => nil})
        expect(client1).to(eq(client12))
      end
    end
  end
