module CollectionPageObject
  COLLECTION_HEADER = {css: '.portal-pages-collections-page-header'}
  COLLECTION_CARD = {css: '.portal-pages-collections-card'}
  COLLECTION_CARD_IMAGE = {css: '.portal-pages-collections-card-image-preview'}
  COLLECTION_CARD_NAME = {css: '.portal-pages-collections-card-name'}
  COLLECTION_CARD_DESCRIPTION = {css: '.portal-pages-collections-card-description'}
  SRF_HOME_LINK = {css: '.special-link'}

  def verify_collection_page
    wait_for {displayed? (COLLECTION_HEADER)}
    return true
  end


end