require 'docking_station'

describe DockingStation do 
  it {is_expected.to respond_to :release_bike}
  it 'Check bike is working?' do
    bike = Bike.new
    expect(bike).to be_working
  end
  it 'Test dock method' do
    expect(subject).to respond_to(:dock).with(1)
  end
  it 'Test if a bike is docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end
  it 'Tests if a bike is no bikes are availiable' do
    expect {subject.release_bike}.to raise_error(RuntimeError, "No Bikes Availiable")
  end
  it 'Produces error if docking station is full' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock Bike.new}
    expect {subject.dock(Bike.new)}.to raise_error(RuntimeError, 'Docking station is full')
  end
  it 'Check capacity can be changed' do
    expect(DockingStation.new(21).capacity).to eq(21)
  end
  it 'Checks the default value of capacity' do 
    expect(DockingStation.new.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  context 'broken bikes' do
    it 'check if bike test broken method' do
      expect(subject).to respond_to(:broken)
    end
    it 'check if bike is broken' do
      broken_bike = Bike.new
      subject.broken(broken_bike)
      expect(broken_bike.working?).to be false
    end
    it 'doesnt release any broken bike' do
      broken_bike = Bike.new
      subject.broken(broken_bike)
      expect{ subject.release_bike }.to raise_error('The bike is broken')
    end
   end 
end

