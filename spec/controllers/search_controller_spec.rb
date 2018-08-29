require 'rails_helper'

describe SearchController, elasticsearch: true do
  describe 'GET #index when it searchs for KarateDojo, DramaClub,
            SoccerClub or PhotographyWorkshop' do
    let!(:karate_dojo) do
      KarateDojo.create(name: 'cobra kai', city: 'pasadena', category: 'adults',
                        activity_code:'martial_arts')
    end
    let!(:drama_club) do
      DramaClub.create(title: 'drama club souls', city: 'pasadena', category: 'expresive',
                        time_range:'afternoon')
    end
    let!(:soccer_club) do
      SoccerClub.create(title: 'Soccer Club 10', city: 'pasadena', sponsors: 'nike',
                        professional: true)
    end
    let!(:photography_workshop) do
      PhotographyWorkshop.create(name: 'photography in life', city:'phoenix',
                                 cameras_availables: 5, max_students: 5)
    end

    context 'the text search is partially written' do
      before do
        get :index, params: { query: 'pasa' }
      end

      it 'returns status found' do
        expect(response).to have_http_status(:found)
      end

      it 'founds a karate dojo, drama club  and a soccer club' do
        expect(JSON.parse(response.body).map { |hint|  hint['record_type'] }).to include(
          'KarateDojo', 'DramaClub', 'SoccerClub'
        )
      end

      it 'shows first a KarateDojo' do
        expect(JSON.parse(response.body)[0]['record_type']).to eq('KarateDojo')
      end
    end

    context 'the text search is bad written' do
      before do
        get :index, params: { q: 'pasadama' }
      end

      it 'returns status found' do
        expect(response).to have_http_status(:found)
      end

      it 'founds a karate dojo, drama club  and a soccer club' do
        expect(JSON.parse(response.body).map { |hint|  hint['record_type'] }).to include(
          'KarateDojo', 'DramaClub', 'SoccerClub'
        )
      end

      it 'shows first a KarateDojo' do
        expect(JSON.parse(response.body)[0]['record_type']).to eq('KarateDojo')
      end
    end
  end
end
