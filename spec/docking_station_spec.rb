require 'docking_station'

describe DockingStation do 
  it {is_expected.to respond_to :release_bike}
  it 'Check bike is working?' do
    expect(subject.release_bike).to be_working
  end
end
