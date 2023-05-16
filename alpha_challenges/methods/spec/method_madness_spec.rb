require './lib/method_madness'

RSpec.describe MethodMadness do
  let(:wu_tang) do
    [
      {
        title: 'Enter the Wu Tang',
        release_date: '11-09-93',
        singles: ['Protect ya neck', 'Method Man', 'C.R.E.A.M.', 'Can it be all so simple'],
        label: 'Loud',
        length: '61:00'
      },
      {
        title: 'Wu-Tang Forever',
        release_date: '06-03-97',
        singles: ['Triumph', 'Itz yours', 'Reunited'],
        label: 'RCA',
        length: '45:00'
      },
      {
        title: 'The W',
        release_date: '11-21-2000',
        singles: ['Protect Ya Neck', 'Gravel Pit', 'Careful'],
        label: 'Loud',
        length: '59:00'
      },
      {
        title: 'Iron Flag',
        release_date: '12-21-01',
        singles: %w[Uzi Rules],
        label: 'Columbia',
        length: '54:00'
      },
      {
        title: 'Eight Diagrams',
        release_date: '12-11-07',
        singles: ['The Heart Gently Weeps'],
        label: 'Universal Motown',
        length: '71:00'
      }
    ]
  end
  let(:wu_tang_collection) { MethodMadness.new(wu_tang) }

  it '#check_for_single' do
    expect(wu_tang_collection.check_for_single('Protect Ya Neck')).to eq('Yes, they released Protect Ya Neck in 2000.')
  end

  it '#check_for_label' do
    expect(wu_tang_collection.check_for_label('RCA')).to eq('Yes, they released Wu-Tang Forever on RCA in 97.')
  end

  it '#check_for_album' do
    expect(wu_tang_collection.check_for_album('Iron Flag')).to eq('Yes, they released Iron Flag on Columbia in 01.')
  end

  it '#change_label' do
    expect(wu_tang_collection.change_album_label('Wu-Tang Forever', 'Sony')).to eq('Wu-Tang Forever is now released on Sony.')
  end

  it '#add_song' do
    wu_tang_collection.add_song('Out of the Woods', 'Eight Diagrams')

    expect(wu_tang_collection.collection.last[:singles]).to include('Out of the Woods')
  end

  it '#single_sampler' do
    expect(wu_tang_collection.single_sampler).to eq(['Protect ya neck', 'Method Man', 'C.R.E.A.M.', 'Can it be all so simple', 'Triumph', 'Itz yours', 'Reunited', 'Protect Ya Neck', 'Gravel Pit', 'Careful', 'Uzi', 'Rules', 'The Heart Gently Weeps'])
  end

  it '#single_counter' do
    expect(wu_tang_collection.single_counter('Enter the Wu Tang')).to eq(4)
  end

  it '#album_length' do
    expect(wu_tang_collection.album_length('Enter the Wu Tang')).to eq('61:00')
  end

  it '#singlegram' do
    expected = {
      "Enter the Wu Tang" => 4,
      "Wu-Tang Forever" => 3,
      "The W" => 3,
      "Iron Flag" => 2,
      "Eight Diagrams" => 1
    }
    expect(wu_tang_collection.singlegram).to eq(expected)
  end

  it '#wu-marathon' do
    expect(wu_tang_collection.wu_marathon).to eq('290:00')
  end
end
