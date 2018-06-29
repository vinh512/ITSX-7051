package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class ImageManager extends DBManager {

    private final DataSource dataSource;

    public ImageManager(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    private ImageInfo imageFromResultSet(ResultSet resultSet) throws SQLException {

        // Returns a newly created ImageInfo object
        return new ImageInfo(
                resultSet.getInt("id"),
                resultSet.getString("filename"),
                resultSet.getString("content_type"),
                resultSet.getInt("ownerId"));
    }

    public List<ImageInfo> getAllImages() {
        List<ImageInfo> images = new ArrayList<>();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.createStatement();
//            "select * from pets, users where userid = pets.ownerId"
//            resultSet = statement.executeQuery("select id, filename, content_type, ownerId from Images where userId=");
             resultSet = statement.executeQuery("select * from images, users where users.userId = images.ownerId");

            while (resultSet.next()) {
                images.add(imageFromResultSet(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
            close(statement);
            close(connection);
        }

        return images;
    }
    
    // Saves Image to database. Note the user's ID is passed in as the image table's ownerId column value
    boolean saveImage(String fileName, String contentType, InputStream inputStream, int userId) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("INSERT INTO images (filename, content_type, content, ownerId) values (?, ?, ?, ?)");
            statement.setString(1, fileName);
            statement.setString(2, contentType);
            statement.setBinaryStream(3, inputStream);
            statement.setInt(4, userId);

            statement.execute();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
            close(statement);
            close(connection);
        }

        return false;
    }
    
    public ImageInfo imageInfoByUserId(int userId) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT id, filename, content_type, ownerId FROM images WHERE ownerId=?");
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();

            System.out.println("Outside" + userId);
            
            if (resultSet.next()) {
                System.out.println("Inside" + userId);
                return imageFromResultSet(resultSet);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } finally {
            close(resultSet);
            close(statement);
            close(connection);
        }

        return null;
    }

    private void copyIO(InputStream contentStream, OutputStream outputStream) throws IOException {
        try {
            byte[] buffer = new byte[32 * 1024];

            while (true) {
                int numread = contentStream.read(buffer);
                if (numread < 1) {
                    break;
                }
                outputStream.write(buffer, 0, numread);
            }
        } finally {
            contentStream.close();
        }
    }

    public boolean copyImageContent(int id, OutputStream out) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT content FROM images where id=?");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                copyIO(resultSet.getBinaryStream("content"),out);
            }

        } catch (IOException | SQLException ex) {
            ex.printStackTrace();
            
        } finally {
            close(resultSet);
            close(statement);
            close(connection);
        }

        return false;
    }
    
     public void deleteImageById(int id) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("DELETE FROM images WHERE ownerId=?");
            statement.setInt(1, id);

            boolean ok = statement.execute();
            //return this to the caller
            System.out.println("DELETE IMAGE OK? " + ok);

        } catch (SQLException ex) {
            ex.printStackTrace();

        } finally {
            close(connection);
            close(statement);
        }
    }
    
}