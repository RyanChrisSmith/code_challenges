require './lib/string_manipulation'

RSpec.describe StringManipulation do
  let(:iverson_rant) { "If I can't practice, I can't practice, man. If I'm hurt, I'm hurt. I mean simple as that. It ain't about that. I mean it's, it's not about that at all. You know what I'm saying. I mean, but it's, it's easy to, to talk about. It's easy to sum it up when you're just talking about practice. We're sitting in here, and I'm supposed to be the franchise player, and we in here talking about practice. I mean, listen, we're talking about practice, not a game, not a game, not a game, we talking about practice. Not a game. Not, not. Not the game that I go out there and die for and play every game like it's my last. Not the game, but we're talking about practice, man. I mean, how silly is that? And we talking about practice. I know I'm supposed to be there. I know I'm supposed to lead by example. I know that, and I'm not, I'm not shoving it aside, you know, like it don't mean anything. I know it's important, I do. I honestly do. But we're talking about practice, man. What are we talking about? We're talking about practice, man." }
  let(:sam_i_am) { "I am Sam\nSam I am\nThat Sam-I-am!\nThat Sam-I-am!\nI do not like that Sam-I-am!\nDo you like green eggs and ham?\nI do not like them, Sam-I-am.\nI do not like\ngreen eggs and ham." }
  let(:string_manipulation) { StringManipulation.new(iverson_rant) }
  let(:sam) { StringManipulation.new(sam_i_am) }

  it 'is a class' do
    expect(string_manipulation).to be_a(StringManipulation)
  end

  it 'has a string attribute' do
    expect(string_manipulation.string).to eq(iverson_rant)
  end

  it '#initialism' do
    expect(string_manipulation.initialism).to eq('IIcpIcpmIIhIhImsatIaatImiinataaYkwIsImbiietttaIetsiuwyjtapWsihaIstbtfpawihtapImlwtapnagnagnagwtapNagNnNtgtIgotadfapeglimlNtgbwtapmImhsitAwtapIkIstbtIkIstlbeIktaInInsiayklidmaIkiiIdIhdBwtapmWawtaWtapm')
  end

  it '#count("practice")' do
    expect(string_manipulation.count("practice")).to eq(10)
  end

  it '#replace_spaces' do
    expect(sam.replace_various_elements).to eq("I_am_Ryan\nRyan_I_am\nThat_Ryan-I-am!\nThat_Ryan-I-am!\nI_d0_n0t_like_that_Ryan-I-am!\nD0_y0u_like_blue_eggs_and_ham?\nI_d0_n0t_like_them,_Ryan-I-am.\nI_d0_n0t_like\nblue_eggs_and_ham.")
  end
end