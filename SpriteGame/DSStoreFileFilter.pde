public class DSStoreFileFilter implements java.io.FilenameFilter {

  public boolean accept(File dir, String name) {
        return !name.equals(".DS_Store");
    }//end accept
}//end class DSStoreFileFilter
