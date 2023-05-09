require './lib/animal'

RSpec.describe Animal do
  let(:fuzzy) { Animal.new('Fuzzy', 'Cat') }
  let(:fido) { Animal.new('Fido', 'Dog') }

  it 'exists' do
    expect(fuzzy).to be_an(Animal)
  end

  it 'has attributes' do
    expect(fido.instance_variables).to eq(%i[@name @species @clean @cleanliness @toys @status])
  end

  it 'has a name and species' do
    expect(fido.name).to eq('Fido')
    expect(fido.species).to eq('Dog')
  end

  it 'does not start with any toys' do
    expect(fuzzy.toys).to eq([])
  end

  it '#add_toy' do
    fuzzy.add_toy('mouse')
    fuzzy.add_toy('ball')

    expect(fuzzy.toys).to eq(%w[mouse ball])
  end

  it '#destroy_toy' do
    fuzzy.add_toy('mouse')
    fuzzy.add_toy('ball')
    fuzzy.add_toy('yarn')

    fuzzy.destroy_toy('ball')

    expect(fuzzy.toys).to eq(%w[mouse yarn])
  end

  it 'has a status' do
    fuzzy.add_toy('mouse')
    fuzzy.add_toy('ball')

    expect(fuzzy.status).to eq("Fuzzy the Cat is #{fuzzy.cleanliness} and has 2 toys.")
  end

  it 'updates status when a toy is added' do
    expect(fido.status).to eq("Fido the Dog is #{fido.cleanliness} and has 0 toys.")

    fido.add_toy('bone')

    expect(fido.status).to eq("Fido the Dog is #{fido.cleanliness} and has 1 toy.")
  end

  it 'updates status when a toy is destroyed' do
    fido.add_toy('bone')
    fido.add_toy('rope')

    expect(fido.status).to eq("Fido the Dog is #{fido.cleanliness} and has 2 toys.")

    fido.destroy_toy('bone')

    expect(fido.status).to eq("Fido the Dog is #{fido.cleanliness} and has 1 toy.")
  end

  it 'has a status with no toys' do
    expect(fido.status).to eq("Fido the Dog is #{fido.cleanliness} and has 0 toys.")
  end

  it 'has a status with one toy' do
    fido.add_toy('bone')

    expect(fido.status).to eq("Fido the Dog is #{fido.cleanliness} and has 1 toy.")
  end

  it 'has a status with multiple toys' do
    fido.add_toy('bone')
    fido.add_toy('rope')

    expect(fido.status).to eq("Fido the Dog is #{fido.cleanliness} and has 2 toys.")
  end

end