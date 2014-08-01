class RegistrationsController < ApplicationController
  def show_form_candidate
  end

  def show_form_recruiter
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
