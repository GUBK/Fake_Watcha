# Watcha clone app
fake 왓챠 based on Rails
---
## 0. 영화정보(Movie)
- model : Movie(title, poster, genre, nation, director)
- controller : movies
- movies#index (모든 영화를 보여주는 root page)
- movies#show (하나의 영화를 상세히 보여주는 page)
- CRUD
- 관리자 권한으로 부여

## 1. 영화 리뷰
- 로그인 된 유저 rating 할 수 있다, comment도 달 수 있다.
- 평점 - rating: integer
- 코멘트 - comment: string
- user_id
- movie_id
- Movie has_many :reviews
- Review belongs_to :movie
- User has_many :reviews
- Review belongs_to :user

## 2. 게시판(Post -> scaffold 사용)
- Scaffold: 'rails g scaffold Post[옵션]'
- title:string, content:text, user_id:integer
- User has_many :posts
- Post belongs_to :user
- 일반유저-비 로그인: R
- 일반유저-로그인: CRUD(본인의 글)

- 관리자: CRUD(모든 글)
- 댓글(Comment)

## 3. 유저관리(User -> devise 사용)
- sign up, login, ---
- 관리자 / 일반유저
- 한글 버전
- view 수정 가능
- nickname 이라는 칼럼 추가함
  * 추가방법
  1. devise 모델을 수정
    db/migrate/20171227003354_devise_create_users.rb
```ruby
  t.string :nickname,           null: false, default: ""
```
  2. 어플리케이션 컨트롤러 수정
    app/controller/application_controller.rb에 아래 코드 추가
```ruby
  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
  end
```
